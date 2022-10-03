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



void show_help(void){
	printf("Please input:\n");
	printf("-split: sensor channel count\n");
	printf("-ch: sensor channel\n");
	printf("-i: input file name or isp\n");
	printf("-dev: v4l2 device name\n");
	printf("-o: output file name or rtsp\n");
	printf("-w: width\n");
	printf("-h: height\n");
	printf("-e: set sensor exposure rate\n");
	printf("-ag: analog gain\n");
	printf("-fps: sensor input framerate\n");
	printf("-r: encoder output framrate\n");
	printf("-inframes: input frames for input file\n");
	printf("-outframes: output frames for output file\n"); 
	printf("-gop: gop length in frames including the I picture,use in IDR\n");
	printf("-rcmode: 0:CONST_QP  1:CBR  2:VBR 3:jpg\n");
	printf("-bitrate: bitrate(Kb)\n");
	printf("-maxbitrate: max bitrate(Kb),use in vbr\n");
	printf("-profile: 0: base  1:main 2:high\n");
	printf("-level: from 10 to 42\n");
	printf("-sliceqp: auto:-1,from 0 to 51 for AVC,from 1 to 100 for JPEG\n");
	printf("-minqp: from 0 to sliceqp\n");
	printf("-maxqp: from sliceqp to 51\n");
	printf("-enableGDR: enbale intra refresh and specifies intra refresh peroid\n");
	printf("-GDRMode: GDR mode 0:GDR_VERTICAL 1:GDR_HORIZONTAL\n");
	printf("-enableLTR: enbale long term reference picture and specifies LTR refresh frequency in number of frames,0 to disable use refresh frequency\n");
	printf("-roi: roi config file\n");
	printf("-ae: enable ae\n");
	printf("-conf: v4l2 config file\n");
	/* audio */
	printf("-alsa: enable audio\n");
	printf("-ac: audio channel count\n");
	printf("-ar: audio sample rate\n");
	printf("-af: auido sample format\n");
	printf("-ad: audio device");
	printf("-lossless: enable jpeg lossless encode");
	// printf("-aof: audio output frames\n");
}


// int parse_cmdXX(int argc, char *argv[]) {
// 	int i = 0;
// 	int j = 0;
// 	int cur_ch = 0;
// 	for(i=1; i<argc; i+=2)  {
//     	if(strcmp(argv[i], "-help") == 0) {
//       		show_help();
//       		return 1;
//     	}
//     	else if(strcmp(argv[i], "-split") == 0) {
//       		pCtx->ch_cnt = atoi(argv[i+1]);
//       		printf("-split: %d\n", pCtx->ch_cnt);
//       		alloc_context(pCtx);
//     	}
//     	else if(strcmp(argv[i], "-ch") == 0) {
//       		cur_ch = atoi(argv[i+1]);
//       		if(cur_ch >= pCtx->ch_cnt) {
//         		printf("Channel set error: %d", cur_ch);
//       		}
//       		pCtx->ch_en[cur_ch] = 1;
//       		printf("-ch%d: %d\n", cur_ch, pCtx->ch_en[cur_ch]);
//       		memset(&pCtx->Cfg[cur_ch],0,sizeof(EncSettings));
//     	}
//     	else if(strcmp(argv[i], "-i") == 0)  {      
//       		pCtx->video_enabled = 1;
//       		if(strcmp(argv[i+1], "isp") == 0) {
//         		if(pCtx->ch_cnt != 1) {
//           			printf("split prarm error!\n");
//           			return -1;
//         		}
//         		pCtx->enable_isp[cur_ch] = 1;
//       		}
//       		else if(strcmp(argv[i+1], "v4l2") == 0) {
//         		pCtx->enable_v4l2[cur_ch] = 1;
//       		}
//       		else {
//         		pCtx->enable_isp[cur_ch] = 0;    
//         		pCtx->enable_v4l2[cur_ch] = 0;
//         		printf("infilename: %s\n", argv[i+1]);
//         		if( (pCtx->in_file[cur_ch] = fopen(argv[i+1],"r+b")) == NULL ) {
//           			printf("Cannot open input file!!!\n");
//           			return -1;
//         		} 
//         		pCtx->infilename[cur_ch] = argv[i+1];
//       		}
//     	}
// 		else if(strcmp(argv[i], "-dev") == 0)     {
// 			pCtx->dev_name[cur_ch] = (char*)malloc(strlen(argv[i+1])+1);
// 			memcpy(pCtx->dev_name[cur_ch], argv[i+1], strlen(argv[i+1])+1);
// 			printf("ch%d: %s\n", cur_ch, pCtx->dev_name[cur_ch]);
// 		}
// 		else if(strcmp(argv[i], "-o") == 0)	{
// 			if(strcmp(argv[i+1], "rtsp") == 0) {
// 				pCtx->enable_rtsp[cur_ch] = 1;
// 			}
// 			else {
//         		pCtx->enable_rtsp[cur_ch] = 0;
//         		printf("outfilename: %s\n", argv[i+1]);
//         		if ((pCtx->out_file[cur_ch]=fopen(argv[i+1],"w+b")) == NULL ) {
//           			printf("Cannot open output file!\n");
//           			return -1;
//         		}
//         		pCtx->outfilename[cur_ch] = argv[i+1];
// 	      	}
//     	}
//     	else if(strcmp(argv[i], "-w") == 0) {
// 			pCtx->Cfg[cur_ch].width = atoi(argv[i+1]);
// 			printf("width %d\n", pCtx->Cfg[cur_ch].width);
// 	    }
//     	else if(strcmp(argv[i], "-h") == 0)  {
// 			pCtx->Cfg[cur_ch].height = atoi(argv[i+1]);
// 			printf("height %d\n", pCtx->Cfg[cur_ch].height);
// 	    }
//     	else if(strcmp(argv[i], "-e") == 0) {
//       		pCtx->exp[cur_ch] = atoi(argv[i+1]);
//       		printf("exp = %d\n", pCtx->exp[cur_ch]);
//       		if(pCtx->exp[cur_ch] <= 0 || pCtx->exp[cur_ch] > 128) {
//         		printf("wrong exp = %d\n", pCtx->exp[cur_ch]);
//         		return -1;
//       		}
//       		pCtx->exp[cur_ch] *= 8;
//     	}
//     else if(strcmp(argv[i], "-ag") == 0)
//     {
//       pCtx->agc[cur_ch] = atoi(argv[i+1]);
//       printf("agc = %d\n", pCtx->agc[cur_ch]);
//       if(pCtx->agc[cur_ch] < 0 || pCtx->agc[cur_ch] > 232)
//       {
//         printf("wrong agc = %d\n", pCtx->agc[cur_ch]);
//         return -1;
//       }
//     }
//     else if(strcmp(argv[i], "-fps") == 0)
//     {
//       pCtx->framerate[cur_ch] = atoi(argv[i+1]);
//       printf("framerate %d\n", pCtx->framerate[cur_ch]);
//     }
//     else if(strcmp(argv[i], "-r") == 0)
//     {
//       pCtx->out_framerate[cur_ch] = atoi(argv[i+1]);
//       printf("out_framerate %d\n", pCtx->out_framerate[cur_ch]);
//     }
//     else if(strcmp(argv[i], "-inframes") == 0)
//     {
//       pCtx->input_frames[cur_ch] = atoi(argv[i+1]);
//       printf("input_frames %d\n", pCtx->input_frames[cur_ch]);
//     }
//     else if(strcmp(argv[i], "-outframes") == 0)
//     {
//       pCtx->output_frames[cur_ch] = atoi(argv[i+1]);
//       printf("output_frames %d\n", pCtx->output_frames[cur_ch]);
//     }
//     else if(strcmp(argv[i], "-gop") == 0)
//     {
//       pCtx->Cfg[cur_ch].gopLen = atoi(argv[i+1]);
//       if (pCtx->Cfg[cur_ch].gopLen <= 0)
//       {
//         printf("gop len error\n");
//         return -1;
//       }
//       pCtx->Cfg[cur_ch].FreqIDR = pCtx->Cfg[cur_ch].gopLen;
//       printf("gop length %d\n", pCtx->Cfg[cur_ch].gopLen);
//     }
//     else if(strcmp(argv[i], "-bitrate") == 0)
//     {
//       pCtx->Cfg[cur_ch].BitRate = atoi(argv[i+1])*1000;
//       printf("bitrate %d\n", pCtx->Cfg[cur_ch].BitRate);
//     }
//     else if (strcmp(argv[i],"-maxbitrate") == 0 )
//     {
//       pCtx->Cfg[cur_ch].MaxBitRate = atoi(argv[i+1])*1000;
//       printf("maxbitrate %d\n", pCtx->Cfg[cur_ch].MaxBitRate);
//     }
//     else if (strcmp(argv[i],"-profile") == 0 )
//     {
//       int nProfile = atoi(argv[i+1]);
//       if (nProfile > 2 || nProfile < 0)
//       {
//         printf("profile:%d error\n",nProfile);
//         return -1;
//       }
//       pCtx->Cfg[cur_ch].profile = (AVC_Profile)nProfile;
//       printf("profile %d\n", pCtx->Cfg[cur_ch].profile);
//     }
//     else if (strcmp(argv[i],"-level") == 0 )
//     {
//       int nLevel = atoi(argv[i+1]);
//       if (nLevel < 10 || nLevel > 42)
//       {
//         printf("level:%d error\n",nLevel);
//         return -1;
//       }
//       pCtx->Cfg[cur_ch].level = nLevel;
//       printf("level:%d\n",nLevel);
//     }
//     else if (strcmp(argv[i],"-sliceqp") == 0 )
//     {
//       int nqp = atoi(argv[i+1]);
//       pCtx->Cfg[cur_ch].SliceQP = nqp;
//       printf("sliceqp %d\n", nqp);
//     }
//     else if (strcmp(argv[i],"-lossless") == 0 )
//     {
//       int lossless = atoi(argv[i+1]);
//       pCtx->Cfg[cur_ch].lossless = lossless;
//       printf("lossless %d\n", lossless);
//     }
//     else if (strcmp(argv[i],"-minqp") == 0 )
//     {
//       int nqp = atoi(argv[i+1]);
//       pCtx->Cfg[cur_ch].MinQP = nqp;
//       printf("minqp %d\n", nqp);
//     }
//     else if (strcmp(argv[i],"-maxqp") == 0 )
//     {
//       int nqp = atoi(argv[i+1]);
//       pCtx->Cfg[cur_ch].MaxQP = nqp;
//       printf("maxqp %d\n", nqp);
//     }
//     else if (strcmp(argv[i],"-rcmode") == 0)
//     {
//       int nRcMode = atoi(argv[i+1]);
//       if (nRcMode > 2 || nRcMode < 0)
//       {
//         printf("rcmode error,must be 0-2\n");
//         return -1;
//       }
//       pCtx->Cfg[cur_ch].rcMode = (RateCtrlMode)nRcMode;
//       printf("rcmode %d(0:CONST_QP 1:CBR 2:VBR)\n", pCtx->Cfg[cur_ch].rcMode);
//     }
//     else if(strcmp(argv[i], "-enableGDR") == 0)
//     {
//       pCtx->Cfg[cur_ch].bEnableGDR = true;
//       pCtx->Cfg[cur_ch].FreqIDR = atoi(argv[i+1]);
//       if (pCtx->Cfg[cur_ch].FreqIDR <= 0)
//       {
//         printf("gdr fresh period error\n");
//         return -1;
//       }

//       printf("enable gdr and fresh peroid %d\n", pCtx->Cfg[cur_ch].FreqIDR);
//     }
//     else if (strcmp(argv[i], "-GDRMode") == 0)
//     {
//       int nGdrMode = atoi(argv[i+1]);
//       if (nGdrMode < 0 || nGdrMode >= GDR_CTRLMAX)
//       {
//         printf("gdr mode set error\n");
//         return -1;
//       }
//       pCtx->Cfg[cur_ch].gdrMode = (GDRCtrlMode)nGdrMode;
//     }
//     else if(strcmp(argv[i], "-enableLTR") == 0)
//     {
//       pCtx->Cfg[cur_ch].bEnableLTR = true;
//       pCtx->nLTRFreq[cur_ch] = atoi(argv[i+1]);
//       printf("enable LTR and  refresh frequency %d\n", pCtx->nLTRFreq[cur_ch]);
//     }
//     else if (strcmp(argv[i], "-roi") == 0)
//     {
//       pCtx->roi_filename[cur_ch] = (char*)malloc(strlen(argv[i+1])+1);
//       memcpy(pCtx->roi_filename[cur_ch], argv[i+1], strlen(argv[i+1])+1);
//       printf("roi_filename %s\n",pCtx->roi_filename[cur_ch]);
//       if (0 != roi_parse_conf(pCtx->roi_filename[cur_ch],pCtx->aryEncRoiCfg[cur_ch],pCtx->Cfg[cur_ch].roiCtrlMode))
//       {
//         printf("roi_parse_conf failed\n");
//         //endof_encode();
//         return -1;
//       }
//       else
//       {
//         printf("roi_parse_conf ok\n");
//       }
//     }
//     else if(strcmp(argv[i], "-ae") == 0)
//     {
//       pCtx->ae_enable = atoi(argv[i+1]);
//     }
//     else if(strcmp(argv[i], "-conf") == 0)
//     {
//       pCtx->conf_filename = (char*)malloc(strlen(argv[i+1])+1);
//       memcpy(pCtx->conf_filename, argv[i+1], strlen(argv[i+1])+1);
//       printf("conf_filename %s\n",pCtx->conf_filename);
//     }
//     /* audio parameters */
//     else if(strcmp(argv[i], "-alsa") == 0)
//     {
//       pCtx->audio_enabled = atoi(argv[i+1]);
//     }
//     else if(strcmp(argv[i], "-ac") == 0)
//     {
//       pCtx->audio_ch_cnt = atoi(argv[i+1]);
//     }
//     else if(strcmp(argv[i], "-ar") == 0)
//     {
//       pCtx->audio_sample_rate = atoi(argv[i+1]);
//     }
//     else if(strcmp(argv[i], "-af") == 0)
//     {
//       pCtx->audio_format = (snd_pcm_format_t)(atoi(argv[i+1]));
//     }
//     else if(strcmp(argv[i], "-ad") == 0)
//     {
//       pCtx->audio_device = (char*)malloc(strlen(argv[i+1])+1);
//       memcpy(pCtx->audio_device, argv[i+1], strlen(argv[i+1])+1);
//     }
//     else
//     {
//       printf("Error :Invalid arguments %s\n", argv[i]);      
//       return -1;
//     }
//   }  
//   return 0;
// }