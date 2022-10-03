/* Copyright (c) 2022, Canaan Bright Sight Co., Ltd
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 * 1. Redistributions of source code must retain the above copyright
 * notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
 * CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
 * INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <sys/mman.h>
#include <assert.h>
#include <errno.h>
#include <time.h>
#include <pthread.h>
#include <ctype.h>
#include <malloc.h>
#include <unistd.h>
#include <signal.h>
#include <string.h>
#include <stdlib.h>
#include <poll.h>
#include <linux/videodev2.h>
#include <semaphore.h>
#include<vector>
using namespace std;

#include <sqlite3.h>

// #include "cJSON.h"

// #include "types.h"
// // k510_buildroot/package/encode_app/enc_interface.h
// #include "enc_interface.h"
// #include "isp_video.h"
// #include "VideoStreamer.hh"
// #include "video_app.h"
// #include "media_ctl.h"
// #include "IRtspServer.h"
// #include "alsa/asoundlib.h"
// #include "G711Codec.h"

#include "encode_main.h"



// MainContext Ctx;
// MainContext *pCtx=&Ctx;


int main(int argc, char *argv[]) {
	// EncSettings Cfg;
	int i;
	int src_index=0;
	EncInputFrame input;
	EncOutputStream output;
	int size;
	unsigned int frame_size=0;
	unsigned int output_frames=0;
	unsigned int input_frames=0;
	int stride;    
	int cur_ch = 0;

	memset(pCtx, 0, sizeof(MainContext));
	pCtx->start = 1;

	printf("%s\n", sqlite3_libversion()); 
	sqlite3* db;
	int rc =  sqlite3_open(":memory:", &db);
	sqlite3_close(db);

	if(parse_setting() < 0) {
		
		return -1;
	}

	if(pCtx->video_enabled) {
		procVideoEncode();
  	}


	//  audio
	if(pCtx->audio_enabled) {
        if(!pCtx->audio_ch_cnt)               pCtx->audio_ch_cnt       = 2;
    	if(!pCtx->audio_sample_rate)          pCtx->audio_sample_rate  = 44100;
    	if(!pCtx->audio_format)               pCtx->audio_format       = SND_PCM_FORMAT_S16_LE;
    	if (!pCtx->audioEncType)              pCtx->audioEncType       = (RTSP_AUDIO_TYPE)em_audio_type_g711a;
  	}

  	procRtspSet();
 
  	pCtx->fd_share_memory = open(SHARE_MEMORY_DEV, O_RDWR | O_SYNC);
  	if(pCtx->fd_share_memory < 0) {
     	printf("Open %s Error!\n", SHARE_MEMORY_DEV);
  	}

  	pCtx->fd_ddr = open(DEV_NAME_DDR,O_RDWR|O_SYNC); 
  	if(pCtx->fd_ddr < 0)  {
    	printf("Open %s Error!\n", DEV_NAME_DDR);
  	} 

  	if(pCtx->video_enabled) {
    	for(i = 0; i < pCtx->ch_cnt; i++) {
      		if(!pCtx->ch_en[i]) {
        		continue;
      		}
			stride = ((pCtx->Cfg[i].width + 0x1F) & (~0x1F));
			frame_size = stride*pCtx->Cfg[i].height*3/2;
			pCtx->stride[i] = stride;
			pCtx->width[i] = pCtx->Cfg[i].width;
			pCtx->height[i] = pCtx->Cfg[i].height;
	    }
    
    	// for(i = 0; i < pCtx->ch_cnt; i++)  {
      	// 	if(pCtx->ch_en[i] && (pCtx->enable_isp[i] == 0) && (pCtx->enable_v4l2[i] == 0)) {
        // 		if(get_yuv(pCtx, pCtx->infilename[i], i) < 0) {
        //   			endof_encode();
        //   			return -1;
        // 		}
      	// 	}
    	// }
  	}

#if TEST_ISP
  	if(pCtx->isp_enabled == 1) { 
    	set_QoS();  
    	if(init_isp() < 0) {
      		endof_encode();
      		return -1;
    	}
  	}

#endif
  	if(pCtx->v4l2_enabled == 1) {   
    	set_QoS();
    	if(parse_conf() < 0)  {
      		printf("parse_conf error\n");
      		return -1;
    	}
    	if(init_v4l2() < 0)  {
      		endof_encode();
      		return -1;
    	}
  	}

  	if(pCtx->audio_enabled == 1) {
    	init_audio(pCtx->audio_sample_rate);
  	}

  	signal(SIGINT, exit_handler);
  
  	if(pCtx->video_enabled) {
    	for(i = 0; i < pCtx->ch_cnt; i++) {
      		if(pCtx->ch_en[i]) {
        		pCtx->encoding[i] = 1;
				// int pthread_create(pthread_t *thread, const pthread_attr_t *attr,  void *(*start_routine)(void *), void *arg);
        		pthread_create(&pCtx->encode_thread[i], NULL, encode_ch, &pCtx->ch[i]);
      		}
    	}
  	}
    
  	while(1)  {
    	int encoding = 0;
    	if(pCtx->video_enabled)   {
      		for(i = 0; i < pCtx->ch_cnt; i++) {
        		if(pCtx->encoding[i])  {
          			encoding = 1;
          			break;
        		}
      		}
      		if(encoding)  {
        		usleep(1000*100);
        		continue;
      		}
    	}
    
    	if(pCtx->audio_enabled) { 
      		if(pCtx->audio_processing){
        		usleep(1000*100);
        		continue;
      		}
    	}

    	if(encoding || pCtx->audio_processing) {
      		usleep(1000*100);
      		continue;
    	}
    	else  {
      		break;
    	}

    	if(received_sigterm == 1) {
        	break;
		}
  	}

  	pCtx->start = 0;
  	endof_encode();
	
}


