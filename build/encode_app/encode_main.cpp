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
 * 
 * Hans Edit
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
#include <chrono>
#include <sys/shm.h>
using namespace std;

#include "encode_main.h"
#include "../shared_mem_define.h"


#define USE_RTSP

// #define SETTING_FROM_DB
// #define SETTING_FROM_FILE
#define SETTING_FROM_SHARED_MEMORY

MainContext Ctx;
MainContext *pCtx=&Ctx;

static unsigned int alloc_memory(int fd_share_memory, unsigned int size) {
  	struct share_memory_alloc_align_args  allocAlignMem;
  	
	allocAlignMem.size = (size + 0xfff) & (~0xfff);
  	allocAlignMem.alignment = MEMORY_TEST_BLOCK_ALIGN;
  	allocAlignMem.phyAddr = 0;

  	if(ioctl(fd_share_memory, SHARE_MEMORY_ALIGN_ALLOC, &allocAlignMem) < 0) {
    	printf("alloc_memory Error!\n");
    	return -1;
  	}
  	// printf("%s > phy_addr 0x%x, size %d\n", __FUNCTION__, allocAlignMem.phyAddr, allocAlignMem.size);
  	return allocAlignMem.phyAddr;
}

static unsigned long int get_time() {
	struct timespec time;
	clock_gettime(CLOCK_REALTIME, &time);
	return time.tv_sec * 1000LL * 1000LL * 1000LL + time.tv_nsec;
}

static void enqueue_buf(unsigned char index, int channel) {
	struct v4l2_buffer buf = { 0 };

	buf.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
	buf.memory = V4L2_MEMORY_USERPTR;
	buf.index = index;
	buf.length = pCtx->v4l2_buf[channel][index].length;
	buf.m.userptr = (unsigned long)pCtx->v4l2_buf[channel][index].vaddr;

	if(ioctl(pCtx->fd_v4l2[channel], VIDIOC_QBUF, &buf) < 0) {
		printf("ioctl(VIDIOC_QBUF) fail: index %d, channel: %d\n", index, channel);
	}
}

static void set_ae(char* dev_name, int ae_enable) {
	if((dev_name[10] >= '2') && (dev_name[10] <= '5') && (ae_enable & 0x1))	{
		mediactl_set_ae(ISP_F2K_PIPELINE);
	}
	else if((dev_name[10] >= '6') && (dev_name[10] <= '9') && (ae_enable & 0x1)) {
		mediactl_set_ae(ISP_R2K_PIPELINE);
	}
	return;
}

static void *v4l2_output(void *arg) {
	// printf("%s\n", __FUNCTION__);
	int channel = *(int*)arg;
	printf("%s>channel: %d\n", __FUNCTION__, channel);
	unsigned long int time = 0;
	unsigned long int start_time = 0;
	unsigned long int check_time = 0;

	int iRet = -1;
	struct pollfd tFds[1];
 
	while(pCtx->start)  {
		/* poll */
		tFds[0].fd = pCtx->fd_v4l2[channel];
		tFds[0].events = POLLIN;
		iRet = poll(tFds, 1, /*-1*/3000);//3000ms
		if (iRet <= 0) {
			printf("poll error!\n");
			endof_encode();

			continue;
		}

		struct v4l2_buffer buf;
		int res;

		buf.type   = V4L2_BUF_TYPE_VIDEO_CAPTURE;
		buf.memory = V4L2_MEMORY_USERPTR;
		
		res = ioctl(pCtx->fd_v4l2[channel], VIDIOC_DQBUF, &buf);

		set_ae(pCtx->dev_name[channel], pCtx->ae_enable);

		if (res < 0 || errno == EINTR) 	{
			continue;
		}
		else  {
			time = get_time();
		
			if(start_time == 0) {
				start_time = time;
			}
		
			if(check_time == 0) {
				check_time = time;
			}   
		
			if(pCtx->v4l2_rev[channel][pCtx->v4l2_wp[channel]].addr != V4L2_INVALID_INDEX) {
				printf("v4l2 buffer overflow\n");
				enqueue_buf(buf.index, channel);
			}
			else if(time - start_time < 1000000000) {
				if(pCtx->v4l2_pic_cnt[channel] == 0) {
					enqueue_buf(buf.index, channel);
				}
			}
			else {
				int drop=0, repeat=0;
		
				if(time - check_time >= 1000000000) {
					unsigned long int cap_time, elasp_time, delta=0, duration;
					check_time = 0;

					duration = 1000000.0/pCtx->framerate[channel];
					elasp_time = (time - start_time)/1000.0;
					cap_time = pCtx->v4l2_pic_cnt[channel]*duration;
					if(cap_time < elasp_time) {
						delta = elasp_time - cap_time;
						if(delta > duration/2) {
							repeat = 1;
							// printf("repeat: cnt %d, elasp_time %.4f ms, cap_time %.4f ms\n", pCtx->isp_pic_cnt, elasp_time/1000.0, cap_time/1000.0);
						}
					}
					else {
						delta = cap_time - elasp_time;
						if(delta > duration/2) {
							drop = 1;
							enqueue_buf(buf.index, channel);
							// printf("drop: cnt %d, elasp_time %.4f ms, cap_time %.4f ms\n", pCtx->isp_pic_cnt, elasp_time/1000.0, cap_time/1000.0);
						}
					}
				}
		
				if(drop == 0) {
					if(repeat == 1) {
						pCtx->v4l2_rev[channel][pCtx->v4l2_wp[channel]].addr = buf.index|V4L2_REPEAT_FLAG;
					}
					else {
						pCtx->v4l2_rev[channel][pCtx->v4l2_wp[channel]].addr = buf.index;
					}
					pCtx->v4l2_wp[channel]++;
					pCtx->v4l2_wp[channel] %= ISP_ADDR_BUFFER_CNT;
					pCtx->v4l2_pic_cnt[channel]++;
					sem_post(&pCtx->pSemGetData[channel]);
				}
		
				if(repeat == 1)	{
					pCtx->v4l2_rev[channel][pCtx->v4l2_wp[channel]].addr = buf.index;
					pCtx->v4l2_wp[channel]++;
					pCtx->v4l2_wp[channel] %= ISP_ADDR_BUFFER_CNT;
					pCtx->v4l2_pic_cnt[channel]++;
					sem_post(&pCtx->pSemGetData[channel]);
				}
			}
		}
	}
}

uint32_t queue_frame(int channel) {
	if((pCtx->v4l2_rev[channel][pCtx->v4l2_rp[channel]].addr & V4L2_REPEAT_FLAG) == 0) {
		enqueue_buf(pCtx->v4l2_rev[channel][pCtx->v4l2_rp[channel]].addr, channel);
	}
	pCtx->v4l2_rev[channel][pCtx->v4l2_rp[channel]].addr = V4L2_INVALID_INDEX;
	pCtx->v4l2_rp[channel]++;
	pCtx->v4l2_rp[channel] %= ISP_ADDR_BUFFER_CNT; 

	return 0;
}

// static void *encode_ch(void *arg) {
void *encode_ch(void *arg) {
	// printf("%s\n", __FUNCTION__);
	int channel = *(int*)arg;
	printf("%s>channel: %d\n", __FUNCTION__, channel);
	EncInputFrame input;
	EncOutputStream output;

	int maxSize = 0;
	uint32_t wp = 0;
	int p_x = 0;
	char rs[200];
	char *user_data;
	user_data = (char*)malloc(100);

	int stride = ((pCtx->Cfg[channel].width + 0x1F) & (~0x1F));
	// int frame_size = stride*pCtx->Cfg[channel].height*3/2;

	uint32_t repeated = 0;
	int32_t droped = 0;
	uint32_t framerate_tail = 0;
	uint32_t framerate_tail_cnt = 0;
	uint32_t framerate_tail_gap = 0;
	uint32_t in_framecnt = 0;
	uint32_t out_framecnt = 0;
	int tail_flag = 0;
	int common_drop_flag = 0;


	if(pCtx->framerate_mod[channel]) {
		if(pCtx->drop_en[channel]) {
			framerate_tail = (pCtx->framerate[channel]/(pCtx->drop[channel]+1))%pCtx->out_framerate[channel];
			framerate_tail_cnt = framerate_tail;
			framerate_tail_gap = (pCtx->framerate[channel]/framerate_tail) - 1;
		}
		else if(pCtx->repeat_en[channel]) {
			framerate_tail = pCtx->framerate_mod[channel];
			framerate_tail_cnt = framerate_tail;
			framerate_tail_gap = pCtx->framerate[channel]/framerate_tail;
		}
	}

	pCtx->encoding[channel] = 1;
	while(pCtx->start) {
		memset(&input, 0, sizeof(EncInputFrame));
		memset(&output, 0, sizeof(EncOutputStream));
		uint64_t ts = std::chrono::duration_cast<std::chrono::milliseconds>(std::chrono::system_clock::now().time_since_epoch()).count();

		if(pCtx->enable_v4l2[channel] == 1 && pCtx->v4l2_rev[channel][pCtx->v4l2_rp[channel]].addr != V4L2_INVALID_INDEX) {
			int index;
			//input from v4l2
			input.width = pCtx->width[channel];
			input.height = pCtx->height[channel];
			input.stride = stride;
			index = pCtx->v4l2_rev[channel][pCtx->v4l2_rp[channel]].addr & V4L2_INVALID_INDEX;
			input.data = (unsigned char *)pCtx->v4l2_buf[channel][index].paddr;
			// printf("%s>stride %d, addr 0x%x\n", __FUNCTION__, stride, input.data);
		}
		else {
			if (1 == pCtx->enable_v4l2[channel]){
				sem_wait(&pCtx->pSemGetData[channel]);
			}
		}

		if(input.data) {
			unsigned long int time;

			time = get_time();
			if(pCtx->out_pic[channel] == 0) {
				pCtx->start_time[channel] = time;
			}

			if(pCtx->drop_en[channel]) {
				if(pCtx->framerate_mod[channel]) { //with framerate tail
					if((in_framecnt % (framerate_tail_gap+1) == 0)  || tail_flag) {
						tail_flag = 1;
						queue_frame(channel);
						in_framecnt++;
						framerate_tail_cnt--;
						if(in_framecnt >= pCtx->framerate[channel]) {
							in_framecnt = 0;
							framerate_tail_cnt = framerate_tail;
						}
						droped++;
						if(droped >= pCtx->drop[channel] + 1) {
							droped = 0;
							tail_flag = 0;
						}
						continue;
					}
					else if((pCtx->drop[channel] && (in_framecnt % (pCtx->drop[channel]+1) == 0)) || common_drop_flag) {
						common_drop_flag = 1;
						queue_frame(channel);
						in_framecnt++;
						if(in_framecnt >= pCtx->framerate[channel]) {
							in_framecnt = 0;
							framerate_tail_cnt = framerate_tail;
						}
						droped++;
						if(droped >= pCtx->drop[channel]) {
							droped = 0;
							common_drop_flag = 0;
						}
						continue;
					}
					else {
						in_framecnt++;
						if(in_framecnt >= pCtx->framerate[channel])	{
							in_framecnt = 0;
							framerate_tail_cnt = framerate_tail;
						}
						droped = 0;
					}
				}
				else { //without framerate tail
					if(droped < pCtx->drop[channel]){
						queue_frame(channel);
						droped++;
						continue;
					}
					else {
						droped = 0;
					}
				}
			}
			//set LTR
			if (pCtx->Cfg[channel].bEnableLTR && pCtx->nLTRFreq[channel] > 0) {
				if (0 == (pCtx->out_pic[channel] % pCtx->nLTRFreq[channel])) {
					VideoEncoder_SetLongTerm(pCtx->hEnc[channel]);
				}
				//next frame use ltr
				else if (0 == ((pCtx->out_pic[channel]-1) % pCtx->nLTRFreq[channel])) {
					VideoEncoder_UseLongTerm(pCtx->hEnc[channel]);
					//printf("==========VideoEncoder_UseLongTerm\n");
				}
			}
			// sprintf(user_data, "{\"ts\":%ld, \"string\": hello this is hanskim", ts);
			// VideoEncoder_InsertUserData(pCtx->hEnc[channel], user_data, strlen(user_data));
			VideoEncoder_EncodeOneFrame(pCtx->hEnc[channel], &input);
			VideoEncoder_GetStream(pCtx->hEnc[channel], &output);

#ifdef USE_RTSP
			if (1 == pCtx->enable_rtsp[channel]) {
				if (NULL != pCtx->pRtspServer[channel]) {
					// pCtx->pRtspServer[channel]->PushVideoData(output.bufAddr, output.bufSize,0);
					pCtx->pRtspServer[channel]->PushVideoData(output.bufAddr, output.bufSize, ts);
				}
			}
#endif

			if(output.bufSize != 0) {
				
				if((get_time()-time)/1000000.0 >= (1000.0/pCtx->Cfg[channel].FrameRate)) {
					printf("warning: channel[%d]-encode one frame %.4f ms\n", channel, (get_time()-time)/1000000.0);
				}

				if(pCtx->enable_v4l2[channel] == 1) {
					if(pCtx->repeat_en[channel]) {
						if(framerate_tail) { // with framerate tail 
							if(((in_framecnt % framerate_tail_gap) == 0) && framerate_tail_cnt) {
								if(repeated < pCtx->repeat[channel] + 1) {
									repeated++;
								}
								else {
									repeated = 0;
									framerate_tail_cnt--;
									queue_frame(channel);
									in_framecnt++;
									if(in_framecnt >= pCtx->framerate[channel]) {
										in_framecnt = 0;
										framerate_tail_cnt = framerate_tail;
									}
								}
							}
							else {
								if(repeated < pCtx->repeat[channel]) {
									repeated++;
								}
								else {
									repeated = 0;
									queue_frame(channel);
									in_framecnt++;
									if(in_framecnt >= pCtx->framerate[channel]) {
										in_framecnt = 0;
										framerate_tail_cnt = framerate_tail;
									}
								}
							}
						}
						else { //without framerate tail
							if(repeated < pCtx->repeat[channel]) {
								repeated++;
							}
							else {
								repeated = 0;
								queue_frame(channel);
								in_framecnt++;
								in_framecnt %= pCtx->framerate[channel];
							}
						}
					}
					else if(pCtx->drop_en[channel]) {
						queue_frame(channel);
					}
					else if(!pCtx->drop_en[channel]) { // without repeate and drop
						queue_frame(channel);
						in_framecnt++;
						in_framecnt %= pCtx->framerate[channel];
					}
				}

				
				pCtx->total_out_size[channel] += output.bufSize;
				if (pCtx->Cfg[channel].profile == JPEG) {
					p_x %= 2;
					wp = (uint32_t)p_x * 524288;
					
					rs[0] = 0;

					for(int k=0; k<4; k++) { // frame count
						rs[4+k]  = (char)(pCtx->out_pic[channel] >>(8*k)) &0xFF; 
					}
					
					
					for (int k=0; k<8; k++){
						rs[8+k]  = (char)(ts>>(k*8))& 0xFF;	
					}

					for (int k=0; k<4; k++) {
						rs[16+k] = (char)((output.bufSize>>(k*8)) & 0xFF);
					}


					memcpy((char *)seg_snapshot, &p_x,  1); // current writing
					memcpy((char *)seg_snapshot + wp, rs,  32);
					memcpy((char *)seg_snapshot + wp + 32, output.bufAddr,  output.bufSize);

					p_x ++;
					
				}
				if (channel == 0) {
					memcpy((char *)seg_frame0, &output.bufSize, sizeof(unsigned int));
					memcpy((char *)seg_frame0 + sizeof(unsigned int), output.bufAddr,  output.bufSize);
				}
				else if (channel == 1) {
					memcpy((char *)seg_frame1, &output.bufSize,  sizeof(unsigned int));
					memcpy((char *)seg_frame1 + sizeof(unsigned int), output.bufAddr,  output.bufSize);
				}



				VideoEncoder_ReleaseStream(pCtx->hEnc[channel], &output);
				pCtx->out_pic[channel]++; 
				if (output.bufSize > maxSize)  {
					maxSize = output.bufSize;
				}
				// printf("\rEncoding %d, picture #%-6d, size %7d", channel, pCtx->out_pic[channel], output.bufSize);
				// sprintf(rs+(100*channel),"Encoding %d, picture #%-6d, size %7d, addr:%8x", channel, pCtx->out_pic[channel], output.bufSize, output.bufAddr );
				// memcpy((char *)seg_prompt + 32 + channel*300, rs, sizeof(rs));
				sprintf((char *)seg_prompt + channel*300,"{\"Encoding\": %d, \"picture\" : %d, \"ts\": %ld, \"size\": %d, \"addr\": %d}\0", channel, pCtx->out_pic[channel], ts, output.bufSize, output.bufAddr );
			}  
		}

		if(received_sigterm == 1) {
			break;
		}
		if(pCtx->output_frames[channel] > 0 && pCtx->out_pic[channel] >= pCtx->output_frames[channel]) {
			break;
		}
	}
	pCtx->encoding[channel] = 0;

	return 0;
}

int free_context(void *arg) {
	MainContext *pCtx = (MainContext *)arg;

	free(pCtx->fd_v4l2         );

	for(int i = 0; i < pCtx->ch_cnt; i++) {
		free(pCtx->v4l2_buf[i]);
	}
	free(pCtx->v4l2_buf        );

	for(int i = 0; i < pCtx->ch_cnt; i++) {
		free(pCtx->v4l2_rev[i]);
	}
	free(pCtx->v4l2_rev        );
	if(pCtx->pSemGetData != NULL)  {
		free(pCtx->pSemGetData);
		pCtx->pSemGetData = NULL;
	}

	free(pCtx->v4l2_rp         );
	free(pCtx->v4l2_wp         );
	free(pCtx->v4l2_pic_cnt    );
	free(pCtx->total_out_size  );
	free(pCtx->rtsp_buf_wp     );
	// free(pCtx->enable_isp      );
	free(pCtx->enable_rtsp     );
	free(pCtx->enable_v4l2     );
	// free(pCtx->yuv_phyAddr     );
	// free(pCtx->yuv_vAddr       );
	// free(pCtx->yuv_size        );
	free(pCtx->start_time      );
	free(pCtx->out_buffer      );
	free(pCtx->stream_size     );
	free(pCtx->out_pic         );
	free(pCtx->framerate       );
	free(pCtx->stream_phyAddr  );
	// free(pCtx->in_file         );
	// free(pCtx->out_file        );
	free(pCtx->hEnc            );
	// free(pCtx->shared_phyAddr  );
	// free(pCtx->shared_vAddr    );
	// free(pCtx->shared_size     );
	// free(pCtx->exp             );
	// free(pCtx->agc             );
	free(pCtx->stride          );
	free(pCtx->width           );
	free(pCtx->height          );
	free(pCtx->input_frames    );
	// free(pCtx->isp_thread      );
	free(pCtx->v4l2_thread     );
	free(pCtx->encode_thread   );
	free(pCtx->pRtspServer     );
	free(pCtx->rtspPort		   ); //hans
	free(pCtx->rtspStreamName  ); //hans
	free(pCtx->roi_filename    );
	free(pCtx->aryEncRoiCfg    );
	free(pCtx->nLTRFreq        );
	free(pCtx->Cfg             );
	free(pCtx->ch_en           );
	free(pCtx->infilename      );
	// free(pCtx->outfilename     );
	free(pCtx->dev_name        );
	free(pCtx->output_frames   );
	free(pCtx->encoding        );
	free(pCtx->ch              );
	free(pCtx->repeat          );
	free(pCtx->repeat_en       );
	free(pCtx->drop            );
	free(pCtx->drop_en         );
	free(pCtx->out_framerate   );
	free(pCtx->set_ae   );

	return 0;
}

void endof_encode() { 
	printf("%s\n", __FUNCTION__);
  	// pCtx->start = 0;
	for(int i = 0; i < pCtx->ch_cnt; i++) {
		if(!pCtx->ch_en[i]) {
			continue;
		}
		pCtx->encoding[i] = 0;
		printf("\n%d pictures encoded. Average FrameRate = %.4f Fps, Total Out size = %d\n", pCtx->out_pic[i], (pCtx->out_pic[i] * 1000.0) / ((get_time()-pCtx->start_time[i])/1000000.0), pCtx->total_out_size[i]);

		// if(pCtx->out_file[i]) {
		// 	fclose(pCtx->out_file[i]);
		// }
		// if(pCtx->in_file[i]) {
		// 	fclose(pCtx->in_file[i]);
		// }
		// printf("fclose\n");



		VideoEncoder_Destroy(pCtx->hEnc[i]);
		printf("\nVideoEncoder_Destroy\n");
	}

 
	for(int j = 0; j < pCtx->ch_cnt; j++) {
		if(pCtx->enable_v4l2[j]) {
			enum v4l2_buf_type type;
			int i;

			pthread_join(pCtx->v4l2_thread[j], NULL);
			type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
			ioctl(pCtx->fd_v4l2[j], VIDIOC_STREAMOFF, &type);
		
			for (int i=0; i<ISP_ADDR_BUFFER_CNT; i++) { // free v4l2_buf
				munmap(pCtx->v4l2_buf[j][i].vaddr, pCtx->v4l2_buf[j][i].length);
				if(ioctl(pCtx->fd_share_memory, SHARE_MEMORY_FREE, &pCtx->v4l2_buf[j][i].paddr) < 0){
					printf("%s>Error!\n", __FUNCTION__);
				}        
			}
			// mediactl_exit();
			close(pCtx->fd_v4l2[j]);    
		}

		// if(pCtx->yuv_phyAddr[j] != 0) {
		// 	munmap((void*)pCtx->yuv_vAddr[j], pCtx->yuv_size[j]);
		// 	if(ioctl(pCtx->fd_share_memory, SHARE_MEMORY_FREE, &pCtx->yuv_phyAddr[j]) < 0) {
		// 		printf("%s>Error!\n", __FUNCTION__);
		// 	}
		// } 
	}

	if (pCtx->pSemGetData != NULL) {
		for(int i = 0; i < pCtx->ch_cnt; i++) {
			sem_destroy(&pCtx->pSemGetData[i]);
		}
	}
  
	if(pCtx->setQos) {
		unsigned char *reg;

		reg=(unsigned char * )mmap(NULL, MEMORY_TEST_BLOCK_ALIGN, PROT_READ | PROT_WRITE, MAP_SHARED, pCtx->fd_ddr, (uint64_t)MAILBOX_REG_BASE|0x100000000);
		*(volatile unsigned int *)(reg+0xf4) = pCtx->reg_QoS_ctrl0;
		*(volatile unsigned int *)(reg+0xf8) = pCtx->reg_QoS_ctrl1;
		*(volatile unsigned int *)(reg+0xfc) = pCtx->reg_QoS_ctrl2;
		munmap(reg, MEMORY_TEST_BLOCK_ALIGN);
		
		reg=(unsigned char * )mmap(NULL, MEMORY_TEST_BLOCK_ALIGN, PROT_READ | PROT_WRITE, MAP_SHARED, pCtx->fd_ddr, (uint64_t)NOC_QOS_REG_BASE|0x100000000);
		*(volatile unsigned int *)(reg+0x290) = pCtx->reg_h264_bw;
		*(volatile unsigned int *)(reg+0x28c) = pCtx->reg_h264_mode;
		*(volatile unsigned int *)(reg+0x388) = pCtx->reg_isp_pri;
		*(volatile unsigned int *)(reg+0x38c) = pCtx->reg_isp_mode;
		*(volatile unsigned int *)(reg+0x390) = pCtx->reg_isp_bw;
		munmap(reg, MEMORY_TEST_BLOCK_ALIGN);
		
		reg=(unsigned char * )mmap(NULL, MEMORY_TEST_BLOCK_ALIGN, PROT_READ | PROT_WRITE, MAP_SHARED, pCtx->fd_ddr, (uint64_t)DDR_CTRL_REG_BASE|0x100000000);
		*(volatile unsigned int *)(reg+0x504) = pCtx->reg_ddr_cli;
		munmap(reg, MEMORY_TEST_BLOCK_ALIGN);
		printf("QoS restore\n");
	}

	free_context(pCtx);
	close(pCtx->fd_share_memory);
	close(pCtx->fd_ddr);
	if(pCtx->v4l2_enabled) {
		mediactl_exit();
	}

	dettach_shared_memory();
	printf("\nencode app exits successfully\n");
}

void exit_handler(int sig) {
	if(SIGINT == sig){
		received_sigterm = 1;
	}
	return;
}

// static void set_QoS() {
void set_QoS() {
	unsigned char *reg;

	//QoS setting for memory bandwidth
	reg=(unsigned char * )mmap(NULL, MEMORY_TEST_BLOCK_ALIGN, PROT_READ | PROT_WRITE, MAP_SHARED, pCtx->fd_ddr, MAILBOX_REG_BASE);
	pCtx->reg_QoS_ctrl0 = *(volatile unsigned int *)(reg+0xf4);
	*(volatile unsigned int *)(reg+0xf4) = 0x00110000;
	printf("0x970E00f4: from 0x%08x to 0x%08x\n", pCtx->reg_QoS_ctrl0, *(volatile unsigned int *)(reg+0xf4));
	pCtx->reg_QoS_ctrl1 = *(volatile unsigned int *)(reg+0xf8);
	*(volatile unsigned int *)(reg+0xf8) = 0x00770000;
	printf("0x970E00f8: from 0x%08x to 0x%08x\n", pCtx->reg_QoS_ctrl1, *(volatile unsigned int *)(reg+0xf8));
	pCtx->reg_QoS_ctrl2 = *(volatile unsigned int *)(reg+0xfc);
	*(volatile unsigned int *)(reg+0xfc) = 0x0fffff00;
	printf("0x970E00fc: from 0x%08x to 0x%08x\n", pCtx->reg_QoS_ctrl2, *(volatile unsigned int *)(reg+0xfc));
	munmap(reg, MEMORY_TEST_BLOCK_ALIGN);
	reg=(unsigned char * )mmap(NULL, MEMORY_TEST_BLOCK_ALIGN, PROT_READ | PROT_WRITE, MAP_SHARED, pCtx->fd_ddr, NOC_QOS_REG_BASE);
	pCtx->reg_h264_bw = *(volatile unsigned int *)(reg+0x290);
	*(volatile unsigned int *)(reg+0x290) = 0x110;
	printf("0x99900290: from 0x%08x to 0x%08x\n", pCtx->reg_h264_bw, *(volatile unsigned int *)(reg+0x290));
	pCtx->reg_h264_mode = *(volatile unsigned int *)(reg+0x28c);
	*(volatile unsigned int *)(reg+0x28c) = 0;
	printf("0x9990028c: from 0x%08x to 0x%08x\n", pCtx->reg_h264_mode, *(volatile unsigned int *)(reg+0x28c));
	pCtx->reg_isp_mode = *(volatile unsigned int *)(reg+0x38c);
	*(volatile unsigned int *)(reg+0x38c) = 0;
	printf("0x9990038c: from 0x%08x to 0x%08x\n", pCtx->reg_isp_mode, *(volatile unsigned int *)(reg+0x38c));
	pCtx->reg_isp_pri = *(volatile unsigned int *)(reg+0x388);
	*(volatile unsigned int *)(reg+0x388) = 0x80000707;
	printf("0x99900388: from 0x%08x to 0x%08x\n", pCtx->reg_isp_pri, *(volatile unsigned int *)(reg+0x388));
	pCtx->reg_isp_bw = *(volatile unsigned int *)(reg+0x390);
	*(volatile unsigned int *)(reg+0x390) = 0x00000300;
	printf("0x99900388: from 0x%08x to 0x%08x\n", pCtx->reg_isp_bw, *(volatile unsigned int *)(reg+0x390));
	munmap(reg, MEMORY_TEST_BLOCK_ALIGN);
	reg=(unsigned char * )mmap(NULL, MEMORY_TEST_BLOCK_ALIGN, PROT_READ | PROT_WRITE, MAP_SHARED, pCtx->fd_ddr, DDR_CTRL_REG_BASE);
	pCtx->reg_ddr_cli = *(volatile unsigned int *)(reg+0x504);
	*(volatile unsigned int *)(reg+0x504) = 0x00010303;
	printf("0x98000504: from 0x%08x to 0x%08x\n", pCtx->reg_ddr_cli, *(volatile unsigned int *)(reg+0x504));
	munmap(reg, MEMORY_TEST_BLOCK_ALIGN);

	pCtx->setQos = 1;
}


int init_v4l2() {
    // struct mediactl_info m_info;
    struct v4l2_capability cap;
    enum v4l2_buf_type type;
    struct v4l2_requestbuffers req;
    struct v4l2_format fmt;
    int i;
    int f2k=0, r2k=0;

    for(int j = 0; j < pCtx->ch_cnt; j++)  {
      	for(i=0; i<ISP_ADDR_BUFFER_CNT; i++){
        	pCtx->v4l2_rev[j][i].addr  = V4L2_INVALID_INDEX;
      	}
    }

    for(int i = 0; i < pCtx->ch_cnt; i++){
      	sem_init(&pCtx->pSemGetData[i],0,0);
    }

    if(mediactl_init(REAL_CONF_FILENAME, &(pCtx->dev_info[0])) < 0) {
        printf("mediactl_init error!\n");
        return -1;
    }

    for(int j = 0; j < pCtx->ch_cnt; j++) {
      	if(!pCtx->enable_v4l2[j]) {
        	continue;
      	}
    
      	pCtx->fd_v4l2[j] = open(pCtx->dev_name[j], O_RDWR|O_NONBLOCK, 0);
      	if(pCtx->fd_v4l2[j] < 0) {
        	printf("open v4l2 fail\n");
        	close(pCtx->fd_v4l2[j]);
        	return -1;
      	}

      	if(ioctl(pCtx->fd_v4l2[j], VIDIOC_QUERYCAP, &cap) < 0) {
        	printf("ioctl(VIDIOC_QUERYCAP): fail\n");
        	close(pCtx->fd_v4l2[j]);
        	return 0;
      	}

      	if (!(cap.capabilities & V4L2_CAP_VIDEO_CAPTURE)) {
        	printf("Not a video capture device.\n");
        	close(pCtx->fd_v4l2[j]);
        	return 0;
      	}

      	if (!(cap.capabilities & V4L2_CAP_STREAMING)) {
        	printf("The device does not support the streaming I/O method.\n");
        	close(pCtx->fd_v4l2[j]);
        	return 0;
      	}

      	memset(&fmt, 0, sizeof(fmt));
		fmt.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
		fmt.fmt.pix.width = pCtx->width[j];
		fmt.fmt.pix.height = pCtx->height[j];
		fmt.fmt.pix.pixelformat = V4L2_PIX_FMT_YUV420;
		fmt.fmt.pix.field = V4L2_FIELD_ANY;

      	if (ioctl(pCtx->fd_v4l2[j], VIDIOC_S_FMT, &fmt) < 0) {
			printf("ioctl(VIDIOC_S_FMT): fail\n");
			close(pCtx->fd_v4l2[j]);
			return 0;
      	}

		req.type   = V4L2_BUF_TYPE_VIDEO_CAPTURE;
		req.count  = ISP_ADDR_BUFFER_CNT;
		req.memory = V4L2_MEMORY_USERPTR;

		if (ioctl(pCtx->fd_v4l2[j], VIDIOC_REQBUFS, &req) < 0) {
			printf("ioctl(VIDIOC_REQBUFS): fail\n");
			close(pCtx->fd_v4l2[j]);
			return 0;
		}
      	printf("req.count %d\n", req.count);

		for (i = 0; i<ISP_ADDR_BUFFER_CNT; i++) {
			struct v4l2_buffer buf;

			buf.type   = V4L2_BUF_TYPE_VIDEO_CAPTURE;
			buf.index  = i;
			buf.memory = V4L2_MEMORY_USERPTR;
			
			if (ioctl(pCtx->fd_v4l2[j], VIDIOC_QUERYBUF, &buf) < 0) {
				printf("ioctl(VIDIOC_QUERYBUF) fail: index %d\n", buf.index);
				close(pCtx->fd_v4l2[j]);
				return 0;
			}

			pCtx->v4l2_buf[j][i].length = (buf.length + 0xfff) & (~0xfff);
			pCtx->v4l2_buf[j][i].paddr = alloc_memory(pCtx->fd_share_memory, pCtx->v4l2_buf[j][i].length);
			if(pCtx->v4l2_buf[j][i].paddr == -1) {
				printf("Not enough memory for v4l2 buf.\n");
				return -1;
			}
			// void * mmap(void *start, size_t length, int prot, int flags, int flides, off_t offset);

			pCtx->v4l2_buf[j][i].vaddr = mmap(NULL, pCtx->v4l2_buf[j][i].length, PROT_READ|PROT_WRITE, MAP_SHARED, pCtx->fd_ddr, pCtx->v4l2_buf[j][i].paddr);

			if(pCtx->v4l2_buf[j][i].vaddr == MAP_FAILED) {
				printf("v4l2 mmap fail\n");
				close(pCtx->fd_v4l2[j]);
				return 0;
			}
		}

      	for (i = 0; i<ISP_ADDR_BUFFER_CNT; i++)  {
			struct v4l2_buffer buf;

			buf.type   = V4L2_BUF_TYPE_VIDEO_CAPTURE;
			buf.index  = i;
			buf.memory = V4L2_MEMORY_USERPTR;

			buf.length = pCtx->v4l2_buf[j][i].length;
			buf.m.userptr = (unsigned long)pCtx->v4l2_buf[j][i].vaddr;

			if (ioctl(pCtx->fd_v4l2[j], VIDIOC_QBUF, &buf) < 0) {
				printf("ioctl(VIDIOC_QBUF) fail: index %d\n", buf.index);
				close(pCtx->fd_v4l2[j]);
				return 0;
			}
		}

		type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
		if (ioctl(pCtx->fd_v4l2[j], VIDIOC_STREAMON, &type) < 0) {
			printf("ioctl(VIDIOC_STREAMON): fail\n");
			close(pCtx->fd_v4l2[j]);
			return 0;
		}      
      
      	pthread_create(&pCtx->v4l2_thread[j], NULL, v4l2_output, &pCtx->ch[j]);

    }
}


static int roi_parse_conf(const char* filename,ENC_ROI_CFG_ARRAY&aryEncRoiCfg, ROICtrlMode& nRoiCtrMode)
{
  FILE *fp = NULL;
  int len = 0;
  char* data = NULL;
  char* out = NULL;
  int roiCtrlTmp = 0;
  cJSON *root;
  cJSON *jsonCtrlMode;
  cJSON *jsonRoiRegion;
  cJSON*jsonRoiRegionArray;
  cJSON*jsonRoiRect;
  cJSON*jsonRoiRegionEnable;

  fp=fopen(filename,"rb");
  if(NULL == fp)
  {
    printf("read %s:file %s no exist!\n",__func__,filename);
    return -1;
  }
  fseek(fp,0,SEEK_END);
  len=ftell(fp);
  fseek(fp,0,SEEK_SET);
  data=(char*)malloc(len+1);
  fread(data,1,len,fp);
  fclose(fp);


  root=cJSON_Parse(data);
  if (!root) 
  {
    printf("cJSON_Parse Error:%s [%s]\n",filename,cJSON_GetErrorPtr());
    return -1;
  }
  else
  {

    jsonCtrlMode = cJSON_GetObjectItem(root,"roiCtrMode");
    if(NULL == jsonCtrlMode)
    {
      printf("not find roiCtrMode node\n");
      return -1;
    }
    if(jsonCtrlMode->type==cJSON_Number)
    {
      roiCtrlTmp = jsonCtrlMode->valueint;
      if (roiCtrlTmp != ROI_QP_TABLE_RELATIVE && roiCtrlTmp != ROI_QP_TABLE_ABSOLUTE)
      {
        printf("roiCtrMode type invalid\n");
        return -1;      
      }
    }
    else
    {
      return -1;
    }

    jsonRoiRegionArray = cJSON_GetObjectItem(root,"roiRegion");
    if(NULL == jsonRoiRegionArray)
    {
      printf("not find roiRegion node\n");
      return -1;
    }
    int nSize = cJSON_GetArraySize(jsonRoiRegionArray);
    if (nSize <= 0)
    {
      printf("roiRegion array is empty\n");
      return -1;
    }

    EncROICfg   encRoiCfg;
    int nIndex = 0;
    for (int i = 0;i < nSize;i ++)
    {
      jsonRoiRegion = cJSON_GetArrayItem(jsonRoiRegionArray,i);
      jsonRoiRegionEnable = cJSON_GetObjectItem(jsonRoiRegion,"enable");
      //filter unenable item
      if (NULL != jsonRoiRegionEnable)
      {
        if(jsonRoiRegionEnable->type==cJSON_Number)
        {
          if (0 == jsonRoiRegionEnable->valueint)
          {
            printf("roi_parse_conf pass an iterm\n");
            continue;
          }
        }
      }

      encRoiCfg.uIndex = nIndex++;
      encRoiCfg.bEnable = true;
      encRoiCfg.uQpValue = cJSON_GetObjectItem(jsonRoiRegion,"qpValue")->valueint;
      jsonRoiRect = cJSON_GetObjectItem(jsonRoiRegion,"qpRegion");

      encRoiCfg.stRect.s32X = cJSON_GetObjectItem(jsonRoiRect,"left")->valueint;
      encRoiCfg.stRect.s32Y = cJSON_GetObjectItem(jsonRoiRect,"top")->valueint;
      encRoiCfg.stRect.u32Width = cJSON_GetObjectItem(jsonRoiRect,"width")->valueint;
      encRoiCfg.stRect.u32Height = cJSON_GetObjectItem(jsonRoiRect,"heigth")->valueint;
      
      printf("roi cfg info: index:%d,qpvalue:%d,rect(%d,%d,%d,%d)\n",
        encRoiCfg.uIndex,encRoiCfg.uQpValue,encRoiCfg.stRect.s32X,
        encRoiCfg.stRect.s32Y,encRoiCfg.stRect.u32Width,encRoiCfg.stRect.u32Height);

      aryEncRoiCfg.push_back(encRoiCfg);
    }
  }
  cJSON_Delete(root);
  nRoiCtrMode = (ROICtrlMode)roiCtrlTmp ;
 
  return 0;	
}


int parse_conf() {
	printf("%s\n", __FUNCTION__);
	FILE *fp;
	long len;
	char* data;
	char* out;

	cJSON *root;
	cJSON *arrayItem;
	cJSON *item;
	cJSON *newitem;
	cJSON *object;
	cJSON *sensor0;
	cJSON *sensor1;
	cJSON *video;

	char video_used_name[20];
	char video_width_name[20];
	char video_height_name[20];
	int i = 0;

	//  fp=fopen(pCtx->conf_filename,"rb");
	fp=fopen(VIDEO_CONF_FILENAME,"rb");
	if(NULL == fp){
		printf("read %s:file no exist!\n",__func__);
		return -1;
	}
	fseek(fp,0,SEEK_END);
	len=ftell(fp);
	fseek(fp,0,SEEK_SET);
	data=(char*)malloc(len+1);
	fread(data,1,len,fp);
	fclose(fp);
	// doit_video_cfg(data,vi_cfg,sensor0,sensor1,dev_info);

	root=cJSON_Parse(data);
	if (!root) 	{
		printf("Error before: [%s]\n",cJSON_GetErrorPtr());
	}
	else {
		out=cJSON_Print(root);

		sensor0 = cJSON_GetObjectItem(root,"sensor0");
		sensor1 = cJSON_GetObjectItem(root,"sensor1");
		if(sensor0 != NULL && sensor1 != NULL) {
			for(i = 0; i < pCtx->ch_cnt; i++) {
				if(!pCtx->enable_v4l2[i]) {
					continue;
				}
				snprintf(video_used_name, sizeof(video_used_name), "video%c_used", pCtx->dev_name[i][10]);
				snprintf(video_width_name, sizeof(video_width_name), "video%c_width", pCtx->dev_name[i][10]);
				snprintf(video_height_name, sizeof(video_height_name), "video%c_height", pCtx->dev_name[i][10]);
				printf("pCtx->dev_name: %s\n", pCtx->dev_name[i]);
				printf("video_used_name: %s\n", video_used_name);
				printf("video_width_name: %s\n", video_width_name);
				printf("video_height_name: %s\n", video_height_name);

				if((pCtx->dev_name[i][10] >= '2') && (pCtx->dev_name[i][10] <= '5')) {
					video = cJSON_GetObjectItem(sensor0,pCtx->dev_name[i]);
				}
				else if((pCtx->dev_name[i][10] >= '6') && (pCtx->dev_name[i][10] <= '9')) {
					video = cJSON_GetObjectItem(sensor1,pCtx->dev_name[i]);
				}
				else {
					printf("dev name error!\n");
					return -1;
				}
				item = cJSON_GetObjectItem(video, video_used_name);
				cJSON_SetIntValue(item, 1);

				item = cJSON_GetObjectItem(video, video_width_name);
				cJSON_SetIntValue(item, pCtx->width[i]);

				item = cJSON_GetObjectItem(video, video_height_name);
				cJSON_SetIntValue(item, pCtx->height[i]);
			}      
		}
	}

	printf("%s>modified\n", __FUNCTION__);
	fp = fopen(REAL_CONF_FILENAME,"wt");
	if(NULL == fp) {
		printf("write %s:file no exist!\n",__func__);
		return -1;
	}

	out = cJSON_Print(root);
	fprintf(fp,"%s",out);

	fclose(fp);
	free(out);

	free(data);
	printf("parse conf done\n");
	return 0;
}

static void DoEncRoi(EncoderHandle *hEnc,const ENC_ROI_CFG_ARRAY& aryEncRoiCfg) {
	for(int i =0;i < aryEncRoiCfg.size();i ++) {
		VideoEncoder_SetRoiCfg(hEnc,&aryEncRoiCfg[i]);
	}
}

int alloc_context(void *arg) {
	MainContext *pCtx = (MainContext *)arg;

	pCtx->fd_v4l2         = (int*)malloc(sizeof(int) * pCtx->ch_cnt);
	// pCtx->isp_rp          = (int*)malloc(sizeof(int) * pCtx->ch_cnt);
	// pCtx->isp_wp          = (int*)malloc(sizeof(int) * pCtx->ch_cnt);
	// pCtx->isp_addr        = (long(*)[ISP_ADDR_BUFFER_CNT])malloc(sizeof(long) * ISP_ADDR_BUFFER_CNT * pCtx->ch_cnt);
	// pCtx->isp_pic_cnt     = (int*)malloc(sizeof(int) * pCtx->ch_cnt);
	pCtx->v4l2_buf        = (V4L2_BUF**)malloc(sizeof(V4L2_BUF*) *  pCtx->ch_cnt);

	for(int i = 0; i < pCtx->ch_cnt; i++) {
		pCtx->v4l2_buf[i] = (V4L2_BUF*)malloc(sizeof(V4L2_BUF) * ISP_ADDR_BUFFER_CNT);
	}
	pCtx->v4l2_rev        = (V4L2_REV**)malloc(sizeof(V4L2_REV*) * pCtx->ch_cnt);

	for(int i = 0; i < pCtx->ch_cnt; i++) {
		pCtx->v4l2_rev[i] = (V4L2_REV*)malloc(sizeof(V4L2_REV) * ISP_ADDR_BUFFER_CNT);
	}
	pCtx->pSemGetData     = (sem_t*)malloc(sizeof(sem_t) * pCtx->ch_cnt);
	pCtx->v4l2_rp         = (int*)malloc(sizeof(int) * pCtx->ch_cnt);
	pCtx->v4l2_wp         = (int*)malloc(sizeof(int) * pCtx->ch_cnt);
	pCtx->v4l2_pic_cnt    = (int*)malloc(sizeof(int) * pCtx->ch_cnt);
	pCtx->total_out_size  = (int*)malloc(sizeof(int) * pCtx->ch_cnt);
	pCtx->rtsp_buf_wp     = (int*)malloc(sizeof(int) * pCtx->ch_cnt);
	// pCtx->isp_buf_vaddr   = (void**)malloc(sizeof(void*) * pCtx->ch_cnt);
	// pCtx->isp_buf_paddr   = (unsigned int*)malloc(sizeof(unsigned int) * pCtx->ch_cnt);
	// pCtx->isp_buf_size    = (unsigned int*)malloc(sizeof(unsigned int) * pCtx->ch_cnt);
	// pCtx->enable_isp      = (int*)malloc(sizeof(int) * pCtx->ch_cnt);
	pCtx->enable_rtsp     = (int*)malloc(sizeof(int) * pCtx->ch_cnt);
	pCtx->enable_v4l2     = (int*)malloc(sizeof(int) * pCtx->ch_cnt);
	// pCtx->yuv_phyAddr     = (long*)malloc(sizeof(long) * pCtx->ch_cnt);
	// pCtx->yuv_vAddr       = (void**)malloc(sizeof(void*) * pCtx->ch_cnt);
	// pCtx->yuv_size        = (unsigned int*)malloc(sizeof(unsigned int) * pCtx->ch_cnt);
	pCtx->start_time      = (unsigned long int*)malloc(sizeof(unsigned long int) * pCtx->ch_cnt);
	pCtx->out_buffer      = (void**)malloc(sizeof(void*) * pCtx->ch_cnt);
	pCtx->stream_size     = (unsigned int*)malloc(sizeof(unsigned int) * pCtx->ch_cnt);
	pCtx->out_pic         = (unsigned int*)malloc(sizeof(unsigned int) * pCtx->ch_cnt);
	pCtx->framerate       = (unsigned char*)malloc(sizeof(unsigned char) * pCtx->ch_cnt);
	pCtx->stream_phyAddr  = (long*)malloc(sizeof(long) * pCtx->ch_cnt);
	// pCtx->in_file         = (FILE**)malloc(sizeof(FILE*) * pCtx->ch_cnt);
	// pCtx->out_file        = (FILE**)malloc(sizeof(FILE*) * pCtx->ch_cnt);
	pCtx->hEnc            = (EncoderHandle**)malloc(sizeof(EncoderHandle *) * pCtx->ch_cnt);
	// pCtx->shared_phyAddr  = (long*)malloc(sizeof(long) * pCtx->ch_cnt);
	// pCtx->shared_vAddr    = (void**)malloc(sizeof(void*) * pCtx->ch_cnt);
	// pCtx->shared_size     = (unsigned int*)malloc(sizeof(unsigned int) * pCtx->ch_cnt);
	// pCtx->exp             = (unsigned int*)malloc(sizeof(unsigned int) * pCtx->ch_cnt);
	// pCtx->agc             = (unsigned int*)malloc(sizeof(unsigned int) * pCtx->ch_cnt);
	pCtx->stride          = (int*)malloc(sizeof(int) * pCtx->ch_cnt);
	pCtx->width           = (int*)malloc(sizeof(int) * pCtx->ch_cnt);
	pCtx->height          = (int*)malloc(sizeof(int) * pCtx->ch_cnt);
	pCtx->input_frames    = (int*)malloc(sizeof(int) * pCtx->ch_cnt);
	// pCtx->isp_thread      = (pthread_t*)malloc(sizeof(pthread_t) * pCtx->ch_cnt);
	pCtx->v4l2_thread     = (pthread_t*)malloc(sizeof(pthread_t) * pCtx->ch_cnt);
	pCtx->encode_thread   = (pthread_t*)malloc(sizeof(pthread_t) * pCtx->ch_cnt);
	pCtx->pRtspServer     = (IRtspServerEX**)malloc(sizeof(IRtspServerEX*) * pCtx->ch_cnt);
	pCtx->rtspPort        = (int*)malloc(sizeof(int) * pCtx->ch_cnt);  //hans
	pCtx->rtspStreamName  = (char**)malloc(sizeof(char*) * pCtx->ch_cnt); //hans
	pCtx->roi_filename    = (char**)malloc(sizeof(char*) * pCtx->ch_cnt);
	pCtx->aryEncRoiCfg    = (ENC_ROI_CFG_ARRAY*)malloc(sizeof(ENC_ROI_CFG_ARRAY) * pCtx->ch_cnt);
	pCtx->nLTRFreq        = (int*)malloc(sizeof(int) * pCtx->ch_cnt);
	pCtx->Cfg             = (EncSettings*)malloc(sizeof(EncSettings) * pCtx->ch_cnt);
	pCtx->ch_en           = (int*)malloc(sizeof(int) * pCtx->ch_cnt);
	pCtx->infilename      = (char**)malloc(sizeof(char*) * pCtx->ch_cnt);
	// pCtx->outfilename     = (char**)malloc(sizeof(char*) * pCtx->ch_cnt);
	pCtx->dev_name        = (char**)malloc(sizeof(char*) * pCtx->ch_cnt);
	pCtx->output_frames   = (int*)malloc(sizeof(int) * pCtx->ch_cnt);
	pCtx->encoding        = (int*)malloc(sizeof(int) * pCtx->ch_cnt);
	pCtx->ch              = (int*)malloc(sizeof(int) * pCtx->ch_cnt);
	pCtx->repeat          = (uint32_t*)malloc(sizeof(uint32_t) * pCtx->ch_cnt);
	pCtx->repeat_en       = (uint32_t*)malloc(sizeof(uint32_t) * pCtx->ch_cnt);
	pCtx->drop            = (uint32_t*)malloc(sizeof(uint32_t) * pCtx->ch_cnt);
	pCtx->drop_en         = (uint32_t*)malloc(sizeof(uint32_t) * pCtx->ch_cnt);
	pCtx->framerate_mod   = (uint32_t*)malloc(sizeof(uint32_t) * pCtx->ch_cnt);
	pCtx->out_framerate   = (unsigned char*)malloc(sizeof(unsigned char) * pCtx->ch_cnt);
	pCtx->set_ae          = (int*)malloc(sizeof(int) * pCtx->ch_cnt);

	memset(pCtx->Cfg, 0, sizeof(EncSettings));

	return 0;
}

// Settings ~~~
void showSettingInfo() {
	int i;
	printf("\ninformation: \n");
	printf("numberofchannel:%d, video_en:%d, enableAE:%d \n",  pCtx->ch_cnt, pCtx->video_enabled, pCtx->ae_enable);

	printf("\n ch:\t\t");		for(i = 0; i < pCtx->ch_cnt; i++) 	printf("%5d\t",  i);
	printf("\n ch_en:\t\t");	for(i = 0; i < pCtx->ch_cnt; i++) 	printf("%5d\t",  pCtx->ch_en[i]);
	// printf("\n en_isp:\t");		for(i = 0; i < pCtx->ch_cnt; i++) 	printf("%5d\t",  pCtx->enable_isp[i]);
	printf("\n en_v4l2:\t");	for(i = 0; i < pCtx->ch_cnt; i++) 	printf("%5d\t",  pCtx->enable_v4l2[i]);
	printf("\n device:\t");		for(i = 0; i < pCtx->ch_cnt; i++) 	printf("%s ",    pCtx->dev_name[i]);
	printf("\n rtsp:\t\t");		for(i = 0; i < pCtx->ch_cnt; i++) 	printf("%5d\t",  pCtx->enable_rtsp[i]);
	printf("\n rtsp_port:\t");	for(i = 0; i < pCtx->ch_cnt; i++) 	printf("%5d\t",  pCtx->rtspPort[i]);
	printf("\n rtsp_stream:\t");for(i = 0; i < pCtx->ch_cnt; i++) 	printf("%s ",    pCtx->rtspStreamName[i]);
	printf("\n fps:\t\t");		for(i = 0; i < pCtx->ch_cnt; i++) 	printf("%5d\t",  pCtx->framerate[i]);
	printf("\n o-fps:\t\t");	for(i = 0; i < pCtx->ch_cnt; i++) 	printf("%5d\t",  pCtx->out_framerate[i]);
	printf("\n width:\t\t");	for(i = 0; i < pCtx->ch_cnt; i++) 	printf("%5d\t",  pCtx->Cfg[i].width);
	printf("\n height:\t");		for(i = 0; i < pCtx->ch_cnt; i++) 	printf("%5d\t",  pCtx->Cfg[i].height);
	printf("\n rcMode:\t");		for(i = 0; i < pCtx->ch_cnt; i++) 	printf("%5d\t",  pCtx->Cfg[i].rcMode);
	printf("\t (0:CONST_QP, 1:CBR, 2:VBR)");
	printf("\n bitrate:\t");	for(i = 0; i < pCtx->ch_cnt; i++) 	printf("%5dK\t", pCtx->Cfg[i].BitRate/1000);
	printf("\n m-bitrate:\t");	for(i = 0; i < pCtx->ch_cnt; i++) 	printf("%5dK\t", pCtx->Cfg[i].MaxBitRate/1000);
	printf("\n level:\t");		for(i = 0; i < pCtx->ch_cnt; i++) 	printf("%5dK\t", pCtx->Cfg[i].level);
	printf("\n profile:\t");	for(i = 0; i < pCtx->ch_cnt; i++) 	printf("%5d\t",  pCtx->Cfg[i].profile);
	printf("\t (0:AVC_C_BASELINE, 1:AVC_MAIN, 2:AVC_HIGH, 3:JPEG)");
	printf("\n gop:\t\t");		for(i = 0; i < pCtx->ch_cnt; i++) 	printf("%5d\t",  pCtx->Cfg[i].gopLen);
	printf("\n gdr:\t\t");		for(i = 0; i < pCtx->ch_cnt; i++) 	printf("%5d\t",  pCtx->Cfg[i].bEnableGDR);
	printf("\n gdrfreq:\t");	for(i = 0; i < pCtx->ch_cnt; i++) 	printf("%5d\t",  pCtx->Cfg[i].FreqIDR);
	printf("\n gdrmode:\t");	for(i = 0; i < pCtx->ch_cnt; i++) 	printf("%5d\t",  pCtx->Cfg[i].gdrMode);
	printf("\t (0:VERTICAL 1:HORIZONTAL)");
	printf("\n LTR:\t\t");		for(i = 0; i < pCtx->ch_cnt; i++) 	printf("%5d\t",  pCtx->Cfg[i].bEnableLTR);
	printf("\n LTRfreq:\t");	for(i = 0; i < pCtx->ch_cnt; i++) 	printf("%5d\t",  pCtx->nLTRFreq[i]);
	printf("\n roiCtrlMode:\t");for(i = 0; i < pCtx->ch_cnt; i++) 	printf("%5d\t",  pCtx->Cfg[i].roiCtrlMode);
	printf("\t (0:NONE,1:RELATIVE,2:ABSOLUTE)");
	printf("\n sliceqp:\t");	for(i = 0; i < pCtx->ch_cnt; i++) 	printf("%5d\t",  pCtx->Cfg[i].SliceQP);
	printf("\n minqp:\t\t");	for(i = 0; i < pCtx->ch_cnt; i++) 	printf("%5d\t",  pCtx->Cfg[i].MinQP);
	printf("\n maxqp:\t\t");	for(i = 0; i < pCtx->ch_cnt; i++) 	printf("%5d\t",  pCtx->Cfg[i].MaxQP);
	printf("\n aspecRatio:\t");	for(i = 0; i < pCtx->ch_cnt; i++) 	printf("%5d\t",  pCtx->Cfg[i].AspectRatio);
	printf("\t (0:AUTO,1:4_3,2:16_9,3:NONE)");
	printf("\n encDblkCfg:\t");	for(i = 0; i < pCtx->ch_cnt; i++) 	printf("%5d\t",  pCtx->Cfg[i].encDblkCfg.disable_deblocking_filter_idc);
	printf("\n encDblkCfg:\t");	for(i = 0; i < pCtx->ch_cnt; i++) 	printf("%5d\t",  pCtx->Cfg[i].encDblkCfg.slice_beta_offset_div2);
	printf("\n encDblkCfg:\t");	for(i = 0; i < pCtx->ch_cnt; i++) 	printf("%5d\t",  pCtx->Cfg[i].encDblkCfg.slice_alpha_c0_offset_div2);
	printf("\n entropyMode:\t");for(i = 0; i < pCtx->ch_cnt; i++) 	printf("%5d\t",  pCtx->Cfg[i].entropyMode);
	printf("\t (0:CABAC,1:CAVLC,2:MAX)");
	printf("\n bSplitEnable:\t");for(i = 0; i < pCtx->ch_cnt; i++) 	printf("%5d\t",  pCtx->Cfg[i].sliceSplitCfg.bSplitEnable);
	printf("\n");
}

static int setDefaultSettings(){
	for(int i = 0; i < pCtx->ch_cnt; i++) {
		pCtx->ch[i] = i;
		pCtx->Cfg[i].channel     = i;
		if(!pCtx->framerate[i])             pCtx->framerate[i]       = 30;
		if(!pCtx->out_framerate[i])         pCtx->out_framerate[i]   = pCtx->framerate[i];
		if(!pCtx->Cfg[i].width)             pCtx->Cfg[i].width       = 1920;
		if(!pCtx->Cfg[i].height)            pCtx->Cfg[i].height      = 1080;
		if(!pCtx->Cfg[i].BitRate)           pCtx->Cfg[i].BitRate     = 4000000;
		if(!pCtx->Cfg[i].MaxBitRate)        pCtx->Cfg[i].MaxBitRate  = 4000000;
		if(!pCtx->Cfg[i].level)             pCtx->Cfg[i].level       = 42;
		if(!pCtx->Cfg[i].profile)           pCtx->Cfg[i].profile     = AVC_HIGH;
		if(!pCtx->Cfg[i].rcMode)            pCtx->Cfg[i].rcMode      = CBR; 
		if(!pCtx->Cfg[i].SliceQP)           pCtx->Cfg[i].SliceQP     = 25;
		if(!pCtx->Cfg[i].FreqIDR)           pCtx->Cfg[i].FreqIDR     = 25;
		if(!pCtx->Cfg[i].gopLen)            pCtx->Cfg[i].gopLen      = 25;
		if(!pCtx->Cfg[i].AspectRatio)       pCtx->Cfg[i].AspectRatio = ASPECT_RATIO_AUTO;
		if(!pCtx->Cfg[i].MinQP)             pCtx->Cfg[i].MinQP       = 0;//from 0 to SliceQP
		if(!pCtx->Cfg[i].MaxQP)             pCtx->Cfg[i].MaxQP       = 51;//from SliceQP to 51
		if(!pCtx->Cfg[i].roiCtrlMode)       pCtx->Cfg[i].roiCtrlMode = ROI_QP_TABLE_NONE;

		pCtx->Cfg[i].encDblkCfg.disable_deblocking_filter_idc        = 0;
		pCtx->Cfg[i].encDblkCfg.slice_beta_offset_div2               = 1;
		pCtx->Cfg[i].encDblkCfg.slice_alpha_c0_offset_div2           = 1;
		pCtx->Cfg[i].entropyMode                                     = ENTROPY_MODE_CAVLC;
		pCtx->Cfg[i].sliceSplitCfg.bSplitEnable                      = false;
	}

	for(int i=0; i < pCtx->ch_cnt; i++)	{
		if(CBR == pCtx->Cfg[i].rcMode) {
			if (pCtx->Cfg[i].MaxBitRate != pCtx->Cfg[i].BitRate) {
				pCtx->Cfg[i].MaxBitRate = pCtx->Cfg[i].BitRate;
				printf("modify MaxBitRate  to BitRate:%d in cbr mode\n",pCtx->Cfg[i].BitRate);
			}
		}

		if (JPEG == pCtx->Cfg[i].profile) {
			pCtx->Cfg[i].rcMode = CONST_QP; 
			if (pCtx->Cfg[i].SliceQP < 1 || pCtx->Cfg[i].SliceQP > 100) {
				
				printf("slice qp error\n");
				return -1;
			}
		}
		else {
			if (pCtx->Cfg[i].SliceQP < -1 || pCtx->Cfg[i].SliceQP > 51)	{
				printf("slice qp error\n");
				return -1;
			}
		}
	}
	pCtx->ae_enable = 0;
}

// settings from shared memory 
#ifdef SETTING_FROM_SHARED_MEMORY
cJSON *getCjsonItem(cJSON *root, char *object_str){
	cJSON *tmp_obj;
	char *temp = strtok(object_str, ".");

	tmp_obj = root;
	while (temp != NULL){
		if (tmp_obj->type == cJSON_Object) {
			tmp_obj = cJSON_GetObjectItem(tmp_obj, temp);
		}
		else {
			break;
		}
		temp = strtok(NULL, ".");
	}
	return tmp_obj;
}

int parse_setting() {
	printf("%s\n", __FUNCTION__);

	char *data;
	unsigned int len;
	cJSON *root;
	cJSON *encSetting;
	cJSON *tmp;
	cJSON *arrayItem;
	
	data = (char*)malloc(PARAM_SHM_SIZE);
	strcpy(data, (char *)seg_param);
	data = strtok(data, "EOF\0");
	
	root = cJSON_Parse(data);
	if (!root) {
		printf("Error before: [%s]\n",cJSON_GetErrorPtr());
		free(data);
		return -2;
	}

	int ch_en[3] = {0,};
	int cur_ch = 0;
	char *p;
	
	strcpy(data, "encoder.ch0.videocodec.st0.enable");
	tmp = getCjsonItem(root, data);
	if (strcmp(tmp->valuestring,"yes") == 0) {
		ch_en[0] = 1;
	}

	strcpy(data, "encoder.ch0.videocodec.st1.enable");
	tmp = getCjsonItem(root, data);
	if (strcmp(tmp->valuestring,"yes") == 0) {
		ch_en[1] = 1;
	}

	strcpy(data, "encoder.ch0.snapshot.enable");
	tmp = getCjsonItem(root, data);
	if (strcmp(tmp->valuestring,"yes") == 0) {
		ch_en[2] = 1;
	}
	ch_en[2] = 0; // not featable at the time
	printf("channel enable: %d,%d,%d\n", ch_en[0], ch_en[1], ch_en[2]);

	pCtx->ch_cnt = 0;
	for (int i=0; i<3; i++) {
		if (ch_en[i]){
			pCtx->ch_cnt ++;
			pCtx->video_enabled = 1;
			pCtx->v4l2_enabled 	= 1;
			pCtx->isp_enabled 	= 0;
		}
	}
	alloc_context(pCtx);

	for (int i=0; i<(sizeof(ch_en)/sizeof(int)); i++ ){
		printf("i:%d=========\n", i);
		pCtx->ch_en[i]  =  0;
		pCtx->enable_v4l2[i] = 0;

		if (ch_en[i]) {
			if (i==0) {
				pCtx->dev_name[cur_ch] = (char*)malloc(strlen("/dev/video3")+1);
				memcpy(pCtx->dev_name[cur_ch], "/dev/video3", strlen("/dev/video3")+1);
			}
			else if (i==1) {
				pCtx->dev_name[cur_ch] = (char*)malloc(strlen("/dev/video4")+1);
				memcpy(pCtx->dev_name[cur_ch], "/dev/video4", strlen("/dev/video4")+1);
			}
			else if (i==2) {
				pCtx->dev_name[cur_ch] = (char*)malloc(strlen("/dev/video2")+1);
				memcpy(pCtx->dev_name[cur_ch], "/dev/video2", strlen("/dev/video2")+1);
			}

			pCtx->ch_en[cur_ch] = 1;
			pCtx->enable_v4l2[cur_ch]= 1;
			pCtx->framerate[cur_ch]  = 30;
			pCtx->enable_rtsp[cur_ch] = 0 ;
			memset(&pCtx->Cfg[cur_ch], 0, sizeof(EncSettings));

			if (i<2) {
				sprintf(data, "encoder.ch0.videocodec.st%d.standard", i);
				tmp = getCjsonItem(root, data);
				if (strcmp(tmp->valuestring,"h264") == 0){ // h.264
					pCtx->enable_rtsp[cur_ch] = 1 ;
					pCtx->Cfg[i].MinQP = 0 ;
					pCtx->Cfg[cur_ch].MaxQP = 51;

					sprintf(data, "encoder.ch0.videocodec.st%d.h264.profile", i);
					tmp = getCjsonItem(root, data);
					if (strcmp(tmp->valuestring, "hip") == 0) {
						pCtx->Cfg[cur_ch].profile= AVC_HIGH; 
					}
					else if (strcmp(tmp->valuestring, "main") == 0) {
						pCtx->Cfg[cur_ch].profile= AVC_MAIN; 
					}
					else {
						pCtx->Cfg[cur_ch].profile= AVC_C_BASELINE; 
					}

					sprintf(data, "encoder.ch0.videocodec.st%d.h264.bitratectrl", i);
					tmp = getCjsonItem(root, data);
					if (strcmp(tmp->valuestring,"vbr") == 0){
						pCtx->Cfg[cur_ch].rcMode = VBR;
					}
					else if (strcmp(tmp->valuestring,"cbr") == 0){
						pCtx->Cfg[cur_ch].rcMode = CBR;
					}
					else if (strcmp(tmp->valuestring,"const_qp") == 0){
						pCtx->Cfg[cur_ch].rcMode = CONST_QP;
					}

					sprintf(data, "encoder.ch0.videocodec.st%d.h264.bitrate", i);
					tmp = getCjsonItem(root, data);
					pCtx->Cfg[cur_ch].BitRate = (tmp->valueint) * 1000;

					sprintf(data, "encoder.ch0.videocodec.st%d.h264.maxbitrate", i);
					tmp = getCjsonItem(root, data);
					pCtx->Cfg[cur_ch].MaxBitRate = (tmp->valueint) * 1000;

					sprintf(data, "encoder.ch0.videocodec.st%d.h264.maxfps", i);
					tmp = getCjsonItem(root, data);
					pCtx->out_framerate[cur_ch] = tmp->valueint;

					sprintf(data, "encoder.ch0.videocodec.st%d.h264.pcount", i);
					tmp = getCjsonItem(root, data);
					pCtx->Cfg[cur_ch].gopLen  = tmp->valueint;

					sprintf(data, "encoder.ch0.videocodec.st%d.h264.resolution", i);
					tmp = getCjsonItem(root, data);
					p = strtok(tmp->valuestring, "x");
					pCtx->Cfg[cur_ch].width  = std::stoi(p); p = strtok(NULL, "x");
					pCtx->Cfg[cur_ch].height = std::stoi(p); p = strtok(NULL, "x");
					pCtx->Cfg[cur_ch].width  = pCtx->Cfg[cur_ch].width  - (pCtx->Cfg[cur_ch].width%8); // must be multiple of 8
					pCtx->Cfg[cur_ch].height = pCtx->Cfg[cur_ch].height - (pCtx->Cfg[cur_ch].height%8);// must be multiple of 8

				}

				if (strcmp(tmp->valuestring,"mjpeg") == 0){ // jpeg
					pCtx->Cfg[cur_ch].profile = JPEG;
					pCtx->Cfg[cur_ch].rcMode = CONST_QP;
					pCtx->Cfg[i].MinQP = 0 ;
					pCtx->Cfg[cur_ch].MaxQP = 100;

					sprintf(data, "encoder.ch0.videocodec.st%d.mjpeg.maxfps", i);
					tmp = getCjsonItem(root, data);
					pCtx->out_framerate[cur_ch] = tmp->valueint;

					sprintf(data, "encoder.ch0.videocodec.st%d.mjpeg.quality", i);
					tmp = getCjsonItem(root, data);
					pCtx->Cfg[cur_ch].SliceQP = tmp->valueint;

					sprintf(data, "encoder.ch0.videocodec.st%d.mjpeg.resolution", i);
					tmp = getCjsonItem(root, data);
					p = strtok(tmp->valuestring, "x");
					pCtx->Cfg[cur_ch].width  = std::stoi(p); p = strtok(NULL, "x");
					pCtx->Cfg[cur_ch].height = std::stoi(p); p = strtok(NULL, "x");
							
					pCtx->Cfg[cur_ch].width  = pCtx->Cfg[cur_ch].width  - (pCtx->Cfg[cur_ch].width%8); // must be multiple of 8
					pCtx->Cfg[cur_ch].height = pCtx->Cfg[cur_ch].height - (pCtx->Cfg[cur_ch].height%8);// must be multiple of 8
				}

			}
			else {
				sprintf(data, "encoder.ch0.snapshot.maxfps");
				tmp = getCjsonItem(root, data);
				sprintf(data, "encoder.ch0.snapshot.quality");
				tmp = getCjsonItem(root, data);
				sprintf(data, "encoder.ch0.snapshot.resolution");
				tmp = getCjsonItem(root, data);
			}
		
			if(pCtx->enable_rtsp[cur_ch] == 1) {
				sprintf(data, "network.rtsp.port");
				tmp = getCjsonItem(root, data);
				pCtx->rtspPort[cur_ch] = (tmp->valueint) + (cur_ch*2);
				
				sprintf(data, "network.rtp.st%d.unicast.name", cur_ch);
				tmp = getCjsonItem(root, data);
				pCtx->rtspStreamName[cur_ch] = (char*)malloc(strlen(tmp->valuestring)+1);
				memcpy(pCtx->rtspStreamName[cur_ch], tmp->valuestring, strlen(tmp->valuestring)+1);
			}
			cur_ch++;
		}
	}
	free(data);
	cJSON_Delete(root);

	setDefaultSettings();
	showSettingInfo();

	return 0;
}
#endif

#ifdef SETTING_FROM_FILE
int parse_setting() {
	// from setting.conf
	printf("%s\n", __FUNCTION__);
	FILE *fp;
	unsigned int len;
	int cur_ch;
	char* data;

	cJSON *root;
	cJSON *encSetting;
	cJSON *tmp;
	cJSON *arrayItem;

	int i = 0;
	char* devName;


	fp = fopen(SETTING_FILENAME,"rb");
	if(NULL == fp)	{
		printf("read %s:file no exist!\n",__func__);
		return -1;
	}
	fseek(fp,0,SEEK_END);
	len = ftell(fp);
	// printf("%d", len);
	rewind(fp);
	// fseek(fp,0,SEEK_SET);
	data = (char*)malloc(len+1);
	fread(data, 1, len, fp);
	fclose(fp);
	// printf ("%s", data);

	root = cJSON_Parse(data);
	if (!root) {
		printf("Error before: [%s]\n",cJSON_GetErrorPtr());
		free(data);
		return -2;
	}

	encSetting = cJSON_GetObjectItem(root,"ENC");
	// printf("%s", cJSON_Print(encSetting));
		
	len = cJSON_GetArraySize(encSetting);;
	// printf("split: %d\n", len);
	pCtx->ch_cnt = 0;
	for (i=0; i<len; i++){
		arrayItem = cJSON_GetArrayItem(encSetting, i);
		tmp = cJSON_GetObjectItem(arrayItem, "enable");
		if (tmp->type == cJSON_Number) {
			if (tmp->valueint == 1) {
				pCtx->ch_cnt ++;
			}
		}
	}

	alloc_context(pCtx);
	
	for (i=0, cur_ch=0; i<len; i++ ) {
		arrayItem = cJSON_GetArrayItem(encSetting, i);
	
		tmp = cJSON_GetObjectItem(arrayItem, "enable");
		if (tmp->type == cJSON_Number) {
			if (tmp->valueint == 0) {
				continue;
			}
			pCtx->ch_en[cur_ch]  =  1;
			memset(&pCtx->Cfg[cur_ch], 0, sizeof(EncSettings));
		}

		tmp = cJSON_GetObjectItem(arrayItem, "input");
		if (tmp->type == cJSON_String) {
			if (strcmp(tmp->valuestring,"v4l2") == 0) {
				pCtx->video_enabled = 1;
				pCtx->v4l2_enabled = 1;
				pCtx->enable_v4l2[cur_ch] = 1;
			}
			else if (strcmp(tmp->valuestring, "isp") == 0) {
				pCtx->video_enabled = 1;
				// pCtx->isp_enabled = 1;
				// pCtx->enable_isp[cur_ch] = 1;
			}
			else {
				pCtx->video_enabled = 0;
				// pCtx->enable_isp[cur_ch] = 0;
				pCtx->enable_v4l2[cur_ch] = 0;
			}
		}
		tmp = cJSON_GetObjectItem(arrayItem, "dev");
		if (tmp->type == cJSON_String) {
			devName = tmp->valuestring;
			pCtx->dev_name[cur_ch] = (char*)malloc(strlen(devName)+1);
			memcpy(pCtx->dev_name[cur_ch], devName, strlen(devName)+1);
			printf("ch%d: %s\n", cur_ch, pCtx->dev_name[cur_ch]);
		}

		tmp = cJSON_GetObjectItem(arrayItem, "output");
		if (tmp->type == cJSON_String) {
			if (strcmp(tmp->valuestring, "rtsp") == 0) {
				pCtx->enable_rtsp[cur_ch] = 1;
			}
			else if (strcmp(tmp->valuestring, "jpeg") == 0) {
				// pCtx->enable_rtsp[cur_ch] = 1 ;
				pCtx->enable_rtsp[cur_ch] = 0 ;
				pCtx->Cfg[cur_ch].profile = JPEG;
				pCtx->Cfg[cur_ch].rcMode = CONST_QP; 
				// pCtx->outfilename[cur_ch] = (char*)malloc(strlen(JPEG_FILENAME)+1);
				// memcpy(pCtx->outfilename[cur_ch], JPEG_FILENAME, strlen(JPEG_FILENAME)+1);
				// if( (pCtx->out_file[cur_ch] = fopen(JPEG_FILENAME,"wb")) == NULL ) { // w+b
          		// 	printf("Cannot open output file!\n");
          		// 	return -1;
        		// }
			}
		}
		if (pCtx->enable_rtsp[cur_ch] == 1) {
			tmp = cJSON_GetObjectItem(arrayItem, "rtsp_port");
			if (tmp->type == cJSON_Number) {
				pCtx->rtspPort[cur_ch] = tmp->valueint;
			}

			tmp = cJSON_GetObjectItem(arrayItem, "rtsp_stream");
			if (tmp->type == cJSON_String) {
				pCtx->rtspStreamName[cur_ch] = (char*)malloc(strlen(tmp->valuestring)+1);
				memcpy(pCtx->rtspStreamName[cur_ch], tmp->valuestring, strlen(tmp->valuestring)+1);
			}

			if (pCtx->rtspPort[cur_ch] == 0) {
				pCtx->rtspPort[cur_ch] = 8554 + cur_ch*2;
			}
			if (pCtx->rtspStreamName[cur_ch] == NULL) {
				pCtx->rtspStreamName[cur_ch] = (char*)malloc(strlen("testStream")+1);
				memcpy(pCtx->rtspStreamName[cur_ch], "testStream", strlen("testStream")+1);
			}
		}

		tmp = cJSON_GetObjectItem(arrayItem, "framerate");
		if (tmp == NULL) {
			pCtx->framerate[cur_ch] = 30;
		}
		else {
			if (tmp->type == cJSON_Number) {
				pCtx->framerate[cur_ch] = tmp->valueint;
				
			}
		}

		tmp = cJSON_GetObjectItem(arrayItem, "outframerate");
		if (tmp == NULL){
			 pCtx->out_framerate[cur_ch]   = pCtx->framerate[cur_ch];
		}
		else {
			if (tmp->type == cJSON_Number) {
				pCtx->out_framerate[cur_ch] = tmp->valueint;
			}
		}

		tmp = cJSON_GetObjectItem(arrayItem, "width");
		if (tmp == NULL) {
			 pCtx->Cfg[cur_ch].width = 1920;
		}
		else {
			if (tmp->type == cJSON_Number) {
				pCtx->Cfg[cur_ch].width = tmp->valueint;
				pCtx->Cfg[cur_ch].width  = pCtx->Cfg[cur_ch].width  - (pCtx->Cfg[cur_ch].width%8); // must be multiple of 8

			}
		}

		tmp = cJSON_GetObjectItem(arrayItem, "height");
		if (tmp == NULL) {
			 pCtx->Cfg[cur_ch].height = 1080;
		}
		else {		
			if (tmp->type == cJSON_Number) {
				pCtx->Cfg[cur_ch].height = tmp->valueint;
				pCtx->Cfg[cur_ch].height = pCtx->Cfg[cur_ch].height - (pCtx->Cfg[cur_ch].height%8);// must be multiple of 8
			}
		}

		tmp = cJSON_GetObjectItem(arrayItem, "rcMode");
		if (tmp == NULL) {
			pCtx->Cfg[cur_ch].rcMode      = CBR; 
		}
		else {
			if (tmp->type == cJSON_String) {
				if (strcmp(tmp->valuestring,"CBR") == 0) {
					pCtx->Cfg[cur_ch].rcMode = CBR;
				}
				else if (strcmp(tmp->valuestring,"VBR") == 0) {
					pCtx->Cfg[cur_ch].rcMode = VBR;
				}
				else if (strcmp(tmp->valuestring,"CONST_QP ") == 0) {
					pCtx->Cfg[cur_ch].rcMode = CONST_QP;
				}
			}
		}

		tmp = cJSON_GetObjectItem(arrayItem, "bitrate");
		if (tmp == NULL){
			pCtx->Cfg[cur_ch].BitRate     = 4000000;
		}
		else {
			if (tmp->type == cJSON_Number) {
				pCtx->Cfg[cur_ch].BitRate = tmp->valueint;
			}
		}

		tmp = cJSON_GetObjectItem(arrayItem, "maxbitrate");
		if (tmp == NULL){
			pCtx->Cfg[cur_ch].MaxBitRate     = 4000000;
		}
		else {
			if (tmp->type == cJSON_Number) {
				pCtx->Cfg[cur_ch].MaxBitRate = tmp->valueint;
			}
		}

		tmp = cJSON_GetObjectItem(arrayItem, "level");
		if (tmp == NULL){
			pCtx->Cfg[cur_ch].level     = 42;
		}
		else {
			if (tmp->type == cJSON_Number) {
				pCtx->Cfg[cur_ch].level = tmp->valueint;
			}
		}

		tmp = cJSON_GetObjectItem(arrayItem, "sliceQP");
		if (tmp == NULL){
			pCtx->Cfg[cur_ch].SliceQP     = 25;
		}
		else {
			if (tmp->type == cJSON_Number) {
				pCtx->Cfg[cur_ch].SliceQP = tmp->valueint;
			}
		}

		tmp = cJSON_GetObjectItem(arrayItem, "enableAE");
		if (tmp != NULL) {
			if (tmp->type == cJSON_Number) {
				pCtx->ae_enable = tmp->valueint;
			}
		}
		cur_ch++;
	}
	
	cJSON_Delete(root);
	free(data);

	setDefaultSettings();
	showSettingInfo();
	printf("parse setting done\n");
	return 0;
}
#endif

#ifdef SETTING_FROM_DB
int get_db_value(sqlite3 *db, sqlite3_stmt *res, char *groupPath, char* entryName, char *entryValue){
	char *sql;
	sql = (char*)malloc(200);
	
	sprintf(sql, "select entryValue from param_tbl where groupPath='%s' COLLATE NOCASE and entryName='%s' COLLATE NOCASE", groupPath, entryName);
	int rc = sqlite3_prepare_v2(db, sql, -1, &res, 0);
	if (rc != SQLITE_OK) {
		fprintf(stderr, "Cannot get data\n");
		return -1;
	}
	if (sqlite3_step(res) == SQLITE_ROW) {
		sprintf(entryValue,"%s", sqlite3_column_text(res, 0));	
		printf("%s\t%s\n", sql, entryValue);
		sqlite3_finalize(res);
		return 0;
	}
	
	sprintf(entryValue,"");	
	printf("%s\t%s\n", sql, entryValue);
	sqlite3_finalize(res);
	return -1;
}

// int load_db_setting(){
int parse_setting(){
	sqlite3 *db;
	sqlite3_stmt *res;
	char *groupPath = (char*)malloc(50);
	char *entryName = (char*)malloc(50);
	char *entryValue = (char*)malloc(50);

	int step;
    int rc = sqlite3_open(PARAM_DB_NAME, &db);
    if (rc != SQLITE_OK) {
        fprintf(stderr, "Cannot open database: %s\n", sqlite3_errmsg(db));
        sqlite3_close(db);
        
        return -1;
    }

	int ch_en[3] = {0,};
	int cur_ch = 0;

	sprintf(groupPath, "ENCODER.Ch0.Videocodec.St0");
	sprintf(entryName, "enable");
	rc = get_db_value(db, res, groupPath, entryName, entryValue);
	if (rc == 0 && strcmp(entryValue,"yes") == 0) { 
		ch_en[0] = 1;
	}
	sprintf(groupPath, "ENCODER.Ch0.Videocodec.St1");
	rc = get_db_value(db, res, groupPath, entryName, entryValue);
	if (rc == 0 && strcmp(entryValue,"yes") == 0) {
		ch_en[1] = 1;
	}
	sprintf(groupPath, "ENCODER.Ch0.Snapshot");
	rc = get_db_value(db, res, groupPath, entryName, entryValue);
	if (rc == 0 && strcmp(entryValue,"yes") == 0) {
		ch_en[2] = 1;
	}
	ch_en[2] = 0; // not featable at the time
	printf("chen: %d,%d,%d\n", ch_en[0], ch_en[1], ch_en[2]);
	pCtx->ch_cnt = 0;
	for (int i=0; i<3; i++) {
		if (ch_en[i]){
			pCtx->ch_cnt ++;
			pCtx->video_enabled = 1;
			pCtx->v4l2_enabled 	= 1;
			pCtx->isp_enabled 	= 0;
		}
	}
	printf("ch_cnt:%d, sizeof chen:%d\n",pCtx->ch_cnt, sizeof(ch_en));
	alloc_context(pCtx); // with ch_cnt

	for (int i=0; i<(sizeof(ch_en)/sizeof(int)); i++ ){
		printf("i:%d=========\n", i);
		pCtx->ch_en[i]  =  0;
		pCtx->enable_v4l2[i] = 0;

		if (ch_en[i]) {
			if (i==0) {
				pCtx->dev_name[cur_ch] = (char*)malloc(strlen("/dev/video3")+1);
				memcpy(pCtx->dev_name[cur_ch], "/dev/video3", strlen("/dev/video3")+1);
			}
			else if (i==1) {
				pCtx->dev_name[cur_ch] = (char*)malloc(strlen("/dev/video4")+1);
				memcpy(pCtx->dev_name[cur_ch], "/dev/video4", strlen("/dev/video4")+1);
			}
			else if (i==2) {
				pCtx->dev_name[cur_ch] = (char*)malloc(strlen("/dev/video2")+1);
				memcpy(pCtx->dev_name[cur_ch], "/dev/video2", strlen("/dev/video2")+1);
			}

			pCtx->ch_en[cur_ch] = 1;
			pCtx->enable_v4l2[cur_ch]= 1;
			pCtx->framerate[cur_ch]  = 30;
			pCtx->enable_rtsp[cur_ch] = 0 ;
			memset(&pCtx->Cfg[cur_ch], 0, sizeof(EncSettings));

			if (i<2) {
				sprintf(groupPath, "ENCODER.Ch0.Videocodec.St%d", i);
			}
			else {
				sprintf(groupPath, "ENCODER.Ch0.Snapshot");
			}
			sprintf(entryName,"standard");
			if (get_db_value(db, res, groupPath, entryName, entryValue) == 0 ) {
				if (strcmp(entryValue,"h264") == 0){ // h.264
					pCtx->enable_rtsp[cur_ch] = 1 ;
					pCtx->Cfg[i].MinQP = 0 ;
					pCtx->Cfg[cur_ch].MaxQP = 51;					
					sprintf(groupPath, "ENCODER.Ch0.Videocodec.St%d.H264", i);

					sprintf(entryName,"profile");
					if (get_db_value(db, res, groupPath, entryName, entryValue) == 0 ) {
						if (strcmp(entryValue, "HiP") == 0) {
							pCtx->Cfg[cur_ch].profile= AVC_HIGH; 
						}
						else if (strcmp(entryValue, "Main") == 0) {
							pCtx->Cfg[cur_ch].profile= AVC_MAIN; 
						}
						else {
							pCtx->Cfg[cur_ch].profile= AVC_C_BASELINE; 
						}
					}
					sprintf(entryName,"bitratectrl");
					if (get_db_value(db, res, groupPath, entryName, entryValue) == 0 ) {
						if (strcmp(entryValue,"vbr") == 0){
							pCtx->Cfg[cur_ch].rcMode = VBR;
						}
						else if (strcmp(entryValue,"cbr") == 0){
							pCtx->Cfg[cur_ch].rcMode = CBR;
						}
						else if (strcmp(entryValue,"const_qp") == 0){
							pCtx->Cfg[cur_ch].rcMode = CONST_QP;
						}
					}
					sprintf(entryName,"bitrate"); if (get_db_value(db, res, groupPath, entryName, entryValue) == 0 ) {
						pCtx->Cfg[cur_ch].BitRate = std::stoi(entryValue) * 1000;
					}
					sprintf(entryName,"maxbitrate"); if (get_db_value(db, res, groupPath, entryName, entryValue) == 0 ) {
						pCtx->Cfg[cur_ch].MaxBitRate = std::stoi(entryValue) * 1000;
					}
					sprintf(entryName,"resolution"); if (get_db_value(db, res, groupPath, entryName, entryValue) == 0 ) {
						char *p; p = strtok(entryValue, "x");
						pCtx->Cfg[cur_ch].width  = std::stoi(p); p = strtok(NULL, "x");
						pCtx->Cfg[cur_ch].height = std::stoi(p); p = strtok(NULL, "x");
							
						pCtx->Cfg[cur_ch].width  = pCtx->Cfg[cur_ch].width  - (pCtx->Cfg[cur_ch].width%8); // must be multiple of 8
						pCtx->Cfg[cur_ch].height = pCtx->Cfg[cur_ch].height - (pCtx->Cfg[cur_ch].height%8);// must be multiple of 8
					}
					sprintf(entryName,"maxfps"); if (get_db_value(db, res, groupPath, entryName, entryValue) == 0 ) {
						pCtx->out_framerate[cur_ch] = std::stoi(entryValue);
					}
					sprintf(entryName,"pcount"); if (get_db_value(db, res, groupPath, entryName, entryValue) == 0 ) {
						pCtx->Cfg[cur_ch].gopLen  = std::stoi(entryValue);
					}
				}

				else if (strcmp(entryValue,"mjpeg") == 0){ // jpeg
					sprintf(groupPath, "ENCODER.Ch0.Videocodec.St%d.Mjpeg", i);
					pCtx->Cfg[cur_ch].profile = JPEG;
					pCtx->Cfg[cur_ch].rcMode = CONST_QP;
					pCtx->Cfg[i].MinQP = 0 ;
					pCtx->Cfg[cur_ch].MaxQP = 100;
					sprintf(entryName,"maxfps"); if (get_db_value(db, res, groupPath, entryName, entryValue) == 0 ) {
						pCtx->out_framerate[cur_ch] = std::stoi(entryValue);
					}
					sprintf(entryName,"quality"); if (get_db_value(db, res, groupPath, entryName, entryValue) == 0 ) {
						pCtx->Cfg[cur_ch].SliceQP = std::stoi(entryValue);
					}
					sprintf(entryName,"resolution"); if (get_db_value(db, res, groupPath, entryName, entryValue) == 0 ) {
						char *p; p = strtok(entryValue, "x");
						pCtx->Cfg[cur_ch].width  = std::stoi(p); p = strtok(NULL, "x");
						pCtx->Cfg[cur_ch].height = std::stoi(p); p = strtok(NULL, "x");
							
						pCtx->Cfg[cur_ch].width  = pCtx->Cfg[cur_ch].width  - (pCtx->Cfg[cur_ch].width%8); // must be multiple of 8
						pCtx->Cfg[cur_ch].height = pCtx->Cfg[cur_ch].height - (pCtx->Cfg[cur_ch].height%8);// must be multiple of 8
					}
				}
			}
			
			if(pCtx->enable_rtsp[cur_ch] == 1) {
				sprintf(groupPath, "NETWORK.Rtsp");
				sprintf(entryName, "port" );
				if (get_db_value(db, res, groupPath, entryName, entryValue) == 0 ) {
					pCtx->rtspPort[cur_ch] = std::stoi(entryValue) + (cur_ch*2);
				}
				sprintf(groupPath, "NETWORK.Rtp.St%d.Unicast", cur_ch);
				sprintf(entryName, "name" );
				if (get_db_value(db, res, groupPath, entryName, entryValue) == 0 ) {
					pCtx->rtspStreamName[cur_ch] = (char*)malloc(strlen(entryValue)+1);
					memcpy(pCtx->rtspStreamName[cur_ch], entryValue, strlen(entryValue)+1);
				}
			}
			cur_ch++;
		}
	}
	printf("close db\n");
    rc = sqlite3_close(db);
	printf("db closed:%d\n", rc);

	setDefaultSettings();
	showSettingInfo();
	return 0;
}
#endif

static int procVideoEncode(){
	for(int i = 0; i < pCtx->ch_cnt; i++) {
		if(pCtx->ch_en[i]) {
			pCtx->Cfg[i].FrameRate = pCtx->out_framerate[i];
			printf("ch%d-Cfg.Framerate: %d\n", i, pCtx->Cfg[i].FrameRate);
			pCtx->hEnc[i] = VideoEncoder_Create(&pCtx->Cfg[i]);
			
			if (NULL == pCtx->hEnc[i]) {
				printf("[%s] VideoEncoder_Create failed\n", __FUNCTION__);
				return -1;
			}

			if (ROI_QP_TABLE_NONE != pCtx->Cfg[i].roiCtrlMode) {
				DoEncRoi(pCtx->hEnc[i],pCtx->aryEncRoiCfg[i]);
			}

			if((JPEG == pCtx->Cfg[i].profile) && (pCtx->out_framerate[i] != pCtx->framerate[i])) {
				pCtx->repeat_en[i] = 0;
				pCtx->drop_en[i] = 0;
				printf("WARNING: NOT SUPPORT RC CONTROL IN JPEG MODE, OUTPUT WITH INPUT FRAMERATE.\n");
				pCtx->out_framerate[i] = pCtx->framerate[i];
			}
			
			else {
				if(pCtx->out_framerate[i] > pCtx->framerate[i]) {
					pCtx->repeat_en[i] = 1;
					pCtx->repeat[i] = pCtx->out_framerate[i]/pCtx->framerate[i] - 1;
					printf("ch%d: repeat %d\n", i, pCtx->repeat[i]);
					pCtx->framerate_mod[i] = pCtx->out_framerate[i]%pCtx->framerate[i];
					printf("ch%d: framerate_mod %d\n", i, pCtx->framerate_mod[i]);
				}
				else if(pCtx->out_framerate[i] < pCtx->framerate[i])
				{
					pCtx->drop_en[i] = 1;
					pCtx->drop[i] = pCtx->framerate[i]/pCtx->out_framerate[i] - 1;
					printf("ch%d: drop %d\n", i, pCtx->drop[i]);
					pCtx->framerate_mod[i] = pCtx->framerate[i]%pCtx->out_framerate[i];
					// pCtx->framerate_mod[i] = pCtx->out_framerate[i]%pCtx->framerate[i];
					printf("ch%d: framerate_mod %d\n", i, pCtx->framerate_mod[i]);
				}
			}
		}
	}
	return 0;
}

int procRtspSet(){
	printf("create rtsp server");
	// To do. how to set same port and different stream name? 
	for(int cur_ch = 0; cur_ch < pCtx->ch_cnt; cur_ch++) {
    	if (1 == pCtx->enable_rtsp[cur_ch])  {
			pCtx->pRtspServer[cur_ch] = IRtspServerEX::CreateRTSPServerEX();
       		pCtx->pRtspServer[cur_ch]->Init(pCtx->rtspPort[cur_ch], false); // video only first
      		pCtx->pRtspServer[cur_ch]->CreateStreamUrl(pCtx->rtspStreamName[cur_ch]);
			// pCtx->pRtspServer[cur_ch]->CreateStreamUrl("usecondstream");
    	}
  	}
	return 0;
}


int procMain() {
	int i;
	int stride;    
	int cur_ch = 0;

	memset(pCtx, 0, sizeof(MainContext));
	pCtx->start = 1;

	if (parse_setting() <0) {
		return -1;
	}

	if(pCtx->video_enabled) {
		procVideoEncode();
  	}

#ifdef	USE_RTSP
  	procRtspSet();
#endif

  
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
			// frame_size = stride*pCtx->Cfg[i].height*3/2;
			pCtx->stride[i] = stride;
			pCtx->width[i] = pCtx->Cfg[i].width;
			pCtx->height[i] = pCtx->Cfg[i].height;
			// pCtx->width[i] = 1920;
			// pCtx->height[i] = 1080;
	    }
  	}

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
    
    	if(received_sigterm == 1) {
        	break;
		}
  	}

  	pCtx->start = 0;
  	endof_encode();

}



int main(int argc, char *argv[]) {
// shared memory
	mk_shared_memory(PROMPT_SHM_ID);
	mk_shared_memory(PARAM_SHM_ID);
	mk_shared_memory(FRAME_SHM_ID_0);
	mk_shared_memory(FRAME_SHM_ID_1);
	mk_shared_memory(SNAPSHOT_SHM_ID);

	memset((char*)seg_prompt, 0, PROMPT_SHM_SIZE);
	// parse_setting();
	procMain();

    dettach_shared_memory();
}