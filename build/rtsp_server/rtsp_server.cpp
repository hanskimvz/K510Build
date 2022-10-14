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
#include <vector>
#include <sqlite3.h>
using namespace std;


#include "rtsp_server.h"

static void push_av_rtsp(){
	
}


int main(int argc, char *argv[]) {
	int ch_cnt = 2;
	IRtspServerEX **pRtspServer;

	int rtspPort = 554;
	char **rtspStreamName;
    rtspStreamName[0] = (char*)malloc(strlen("video")+1);
    memcpy(rtspStreamName[0], "video", strlen("video")+1);

    rtspStreamName[1] = (char*)malloc(strlen("video")+1);
    memcpy(rtspStreamName[1], "video", strlen("video")+1);

	for(int cur_ch = 0; cur_ch < ch_cnt; cur_ch++) {
		pRtspServer[cur_ch] = IRtspServerEX::CreateRTSPServerEX();

		// if(pCtx->audio_enabled) {
			// pRtspServer[cur_ch]->Init(rtspPort[cur_ch], true);	
		// 	RTSP_AUDIO_INFO audioInfo;
		// 	audioInfo.audioType              = (RTSP_AUDIO_TYPE)pCtx->audioEncType;
		// 	audioInfo.nBitsPerSample        = 16;
		// 	audioInfo.nSamplingFrequency    = pCtx->audio_sample_rate;
		// 	audioInfo.nNumChannels              = pCtx->audio_ch_cnt;
		// 	pCtx->pRtspServer[cur_ch]->SetAudioInfo(audioInfo);	
		// }
		// else {
		pRtspServer[cur_ch]->Init(rtspPort + cur_ch*2, false);
		// }
		pRtspServer[cur_ch]->CreateStreamUrl(rtspStreamName[cur_ch]);
	
  	}
}