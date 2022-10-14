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

// encode app
#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
// #include <fcntl.h>
// #include <sys/ioctl.h>
// #include <sys/mman.h>
#include <assert.h>
#include <errno.h>
#include <time.h>
// #include <pthread.h>
#include <ctype.h>
#include <malloc.h>
// #include <unistd.h>
// #include <signal.h>
// #include <string.h>
#include <stdlib.h>
#include <poll.h>
// #include <linux/videodev2.h>
#include <semaphore.h>
// #include <vector>
using namespace std;
#include "cJSON.h"

// #include "types.h"
// #include "enc_interface.h"
// #include "isp_video.h"
// #include "VideoStreamer.hh"
// #include "video_app.h"
// #include "IRtspServer.h"
// #include "alsa/asoundlib.h"
// #include "G711Codec.h"
// end encode app

#include <nncase/runtime/host_runtime_tensor.h>
#include <nncase/runtime/interpreter.h>
#include <nncase/runtime/runtime_tensor.h>

#include <opencv2/core.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/core/utils/logger.hpp>

#include "string.h"
#include <signal.h>
/*  进程优先级  */
#include <unistd.h>
#include <sched.h>
#include <pthread.h>
#include <thread>
#include <mutex>
/* 申请物理内存 */
#include <fcntl.h>
#include <sys/ioctl.h>
#include <sys/mman.h>

#include <atomic>
#include <vector>

// #include "k510_drm.h"
// #include "media_ctl.h"
#include <linux/videodev2.h>
#include "v4l2.h"


#include "object_detect.h"
#include "cv2_utils.h"
#include "buf_mgt.h"
#include <rapidjson/document.h>
#include <rapidjson/pointer.h>
#include <rapidjson/filereadstream.h>
#include <rapidjson/filewritestream.h>
#include <rapidjson/writer.h>
using namespace rapidjson;

// #define SELECT_TIMEOUT		2000

// struct video_info dev_info[2];
std::mutex mtx;
// uint8_t drm_bufs_index = 0;
// uint8_t drm_bufs_argb_index = 0;
// struct drm_buffer *fbuf_yuv;

// std::vector<cv::Point> points_to_clear[DRM_BUFFERS_COUNT];
// std::vector<std::string> strs_to_clear[DRM_BUFFERS_COUNT];

// #define AUTO_ADAPT_CONFIG_FILE "auto.conf"
// static uint32_t screen_width, screen_height;

// static uint32_t gnne_input_width, gnne_input_height;
// static uint32_t gnne_valid_width, gnne_valid_height;
// static char *video_cfg_file;
// static buf_mgt_t buf_mgt;


#define KMODEL_PATH "/app/ai/kmodel/kmodel_release/object_detect/yolov5s_320/yolov5s_320_sigmoid_bf16_with_preprocess_output_nhwc.kmodel"

#include <sys/shm.h>
#define SH_MEMSIZE  2048
#define SH_KEY      0xF1206

typedef struct  {
    uint16_t label;
    uint16_t score;
    uint16_t x0; 
    uint16_t x1; 
    uint16_t y0; 
    uint16_t y1; 
} metaObject;

// struct f_result {
//     uint8_t     cur_ch;
//     uint16_t    frame_cnt;
//     float       ts;
//     uint16_t    fsize;
//     od_result*  od_rs;
// };

std::atomic<bool> quit(true);

void fun_sig(int sig) {
    if(sig == SIGINT) {
        quit.store(false);
    }
}

// void ai_worker(ai_worker_args ai_args){
void ai_worker(){
    int shmid;
    void *memory_segment = NULL;
    /*** Important, mediactl_init 
      		"/dev/video5":	{
			"video5_used":	1,
			"video5_width":	320,
			"video5_height":	320,
			"video5_height_r":	320,
			"video5_out_format":	0,
			"video5_pitch":	320
		}
        "/dev/video5":{  XXXXX
            "video5_used":1,
            "video5_width":640,
            "video5_height":480,
			"video5_height_r":480,
			"video5_out_format":0,
			"video5_pitch":640
        }


    ****/
    // struct f_result f_rs;
    // memset(f_rs, 0, sizeof(f_result));
    char rs[32];

    uint16_t wp;
    uint16_t frame_cnt = 0;
    uint16_t obj_cnt;

    metaObject obj_meta;

    if((shmid=shmget(SH_KEY, SH_MEMSIZE, IPC_CREAT|0666))==-1){
        printf("shmget failed\n");
        quit.store(false);
    }
    if((memory_segment = shmat(shmid,NULL,0))==(void*)-1){
        printf("shmat failed\n");
        quit.store(false);
    }

    // parse ai worker agrs
    char* kmodel_path;   // object detection kmodel path
    kmodel_path = (char*)malloc(strlen(KMODEL_PATH)+1);
    memcpy(kmodel_path, KMODEL_PATH, strlen(KMODEL_PATH)+1);

    // int valid_width = gnne_valid_width;  // isp ds2 input width, should be the same with definition in video config
    // int valid_height = gnne_valid_height;  // isp ds2 input height, should be the same with definition in video config

    int     net_len = 320;                          // object detection kmodel input size is net_len * net_len
    // int     net_len = 640;                          // object detection kmodel input size is net_len * net_len
    float   obj_thresh = 0.3;                       // object detection thresh  0.5, The threshold used to distinguish between object and non-object
    float   nms_thresh = 0.45;                      // object detection nms thresh 0.45, The threshold used to determine whether two detections are duplicates
    int     is_rgb = 1;                             // isp ds2 input format, RGB or BGR, RGB now
    int     offset_channel = net_len * net_len;     // ds2 channel offset

    std::cout << "object detect"<< std::endl;
    
    // objectDetect od(obj_thresh, nms_thresh, net_len, {valid_width, valid_height});
    objectDetect od(obj_thresh, nms_thresh, net_len, {net_len, net_len});
    std::cout << "load kmodel"<< kmodel_path <<std::endl;
    od.load_model(kmodel_path);  // load kmodel
    

    std::cout << "prepare_memory"<< std::endl;
	od.prepare_memory();  // memory allocation
    std::cout << "prepared memory "<< std::endl;
    
    /****fixed operation for video operation****/
    mtx.lock();
    cv::VideoCapture capture;
    capture.open(5);
    // video setting
    capture.set(cv::CAP_PROP_CONVERT_RGB, 0);
    capture.set(cv::CAP_PROP_FRAME_WIDTH, net_len);
    capture.set(cv::CAP_PROP_FRAME_HEIGHT, net_len);
    // RRRRRR....GGGGGGG....BBBBBB, CHW
    capture.set(cv::CAP_PROP_FOURCC, V4L2_PIX_FMT_RGB24);
    mtx.unlock();


    

    // define cv::Mat for ai input
    // padding offset is (net_len - valid_width) / 2 .. 320x320
    // cv::Mat rgb24_img_for_ai(net_len, net_len, CV_8UC3, od.virtual_addr_input[0] + (net_len - valid_width) / 2);
    cv::Mat rgb24_img_for_ai(net_len, net_len, CV_8UC3, od.virtual_addr_input[0]);
    
    std::cout << "starting loop "<< std::endl;
    
    while(quit.load()) {
        bool ret = false;
        // ScopedTiming st("total", 1);
        mtx.lock();
        ret = capture.read(rgb24_img_for_ai);
        mtx.unlock();

        if(ret == false) {
            printf("fail read.ret\n");
            quit.store(false);
            continue; 
        }

        
        uint64_t ts = std::chrono::duration_cast<std::chrono::milliseconds>(std::chrono::system_clock::now().time_since_epoch()).count();
        
        //padding
        // uint8_t *r_addr, *g_addr, *b_addr;
        // g_addr = (uint8_t *)od.virtual_addr_input[0] + offset_channel;
        // r_addr = is_rgb ? g_addr - offset_channel : g_addr + offset_channel;
        // b_addr = is_rgb ? g_addr + offset_channel : g_addr - offset_channel;
        // if (gnne_valid_width < gnne_input_width) {
        //     uint32_t padding_r = (gnne_input_width - gnne_valid_width);
        //     uint32_t padding_l = padding_r / 2;
        //     padding_r -= padding_l;
        //     for (int row = 0; row < gnne_valid_height; row++) {
        //         uint32_t offset_l = row * gnne_input_width;
        //         uint32_t offset_r = offset_l + gnne_valid_width + padding_l;
        //         memset(r_addr + offset_l, PADDING_R, padding_l);
        //         memset(g_addr + offset_l, PADDING_G, padding_l);
        //         memset(b_addr + offset_l, PADDING_B, padding_l);
        //         memset(r_addr + offset_r, PADDING_R, padding_r);
        //         memset(g_addr + offset_r, PADDING_G, padding_r);
        //         memset(b_addr + offset_r, PADDING_B, padding_r);
        //     }
        // }
        // if (gnne_valid_height < gnne_input_height) {
        //     uint32_t padding = (gnne_input_height - gnne_valid_height) * gnne_input_width;
        //     uint32_t offset = gnne_valid_height * gnne_input_width;
        //     memset(r_addr + offset, PADDING_R, padding);
        //     memset(g_addr + offset, PADDING_G, padding);
        //     memset(b_addr + offset, PADDING_B, padding);
        // }
        
        od.set_input(0);
        od.set_output();
        od.run();
        od.get_output();
        std::vector<BoxInfo> result;
        od.post_process(result);
        
       
        // f_rs.frame_cnt = frame_cnt;
        // f_rs.ts = ts;
        
        obj_cnt = 0;

        rs[0] = 0;
        rs[4]  = (char)frame_cnt &0xFF;
        rs[5]  = (char)(frame_cnt >>8) &0xFF;

        // uint64_t ts = std::chrono::duration_cast<std::chrono::milliseconds>(std::chrono::system_clock::now().time_since_epoch()).count();
        
        for (int k=0; k<8; k++){
            rs[8+k]  = (char)(ts>>(k*8))& 0xFF;	
        }        
        // uint16_t ts_m = ts %1000;
        // rs[6]  = (char)ts_m &0xFF;
        // rs[7]  = (char)(ts_m>>8) &0xFF;

        // ts = ts/1000;
        // rs[8]  = (char)((ts)& 0xFF);
        // rs[9]  = (char)((ts>>8)& 0xFF);
        // rs[10]  = (char)((ts>>16)& 0xFF);
        // rs[11]  = (char)((ts>>24)& 0xFF);

        // printf("\nfr_cnt:%d, ts:%d.%d  ", frame_cnt, ts, ts_m);
        printf("\n");
        // wp = 16;
        for (auto r : result) {
            // printf("cat: %2d, sc:%2.2f, [%3.0f,%3.0f,%3.0f,%3.0f] / ", r.label, (r.score*100.0) , r.x1, r.y1, r.x2, r.y2);
            memset(&obj_meta, 0, sizeof(metaObject));
            obj_meta.x0 = (uint16_t)r.x1 * 0xFFFF / net_len;
            obj_meta.x1 = (uint16_t)r.x2 * 0xFFFF / net_len;
            obj_meta.y0 = (uint16_t)r.y1 * 0xFFFF / net_len;
            obj_meta.y1 = (uint16_t)r.y2 * 0xFFFF / net_len;

            obj_meta.x0 = std::max((uint16_t)0, std::min(obj_meta.x0, (uint16_t)0xFFFF));
            obj_meta.x1 = std::max((uint16_t)0, std::min(obj_meta.x1, (uint16_t)0xFFFF));
            obj_meta.y0 = std::max((uint16_t)0, std::min(obj_meta.y0, (uint16_t)0xFFFF));
            obj_meta.y1 = std::max((uint16_t)0, std::min(obj_meta.y1, (uint16_t)0xFFFF));

            obj_meta.label = (uint16_t)r.label;
            obj_meta.score = (uint16_t)(r.score*10000);

            wp = sizeof(metaObject) * obj_cnt;
            memcpy((char *)memory_segment + 32 + wp, &obj_meta,  sizeof(metaObject));
            printf("lab: %2d, sc:%4d, [%5d,%5d,%5d,%5d] / ", obj_meta.label, (obj_meta.score) , obj_meta.x0, obj_meta.y0, obj_meta.x1, obj_meta.y1);
            obj_cnt ++;
            
        }

        for (int k=0; k<4; k++) {
            rs[16+k] = (char)(((sizeof(metaObject) * obj_cnt)>>(k*8)) & 0xFF);
        }

        memcpy((char *)memory_segment, rs,  sizeof(rs));
        frame_cnt += 1;
    }
    
    printf("\n%s ==========release \n", __func__);
    if(shmctl(shmid, IPC_RMID, 0) == -1) {
        perror("Shmctl failed");
    }
    else {
        printf("Shared memory end");
    }

    mtx.lock();
    capture.release();
    mtx.unlock();
}


int main(int argc, char *argv[]) {

    // Object detect
    std::cout << "case " << argv[0] << " build " << __DATE__ << " " << __TIME__ << std::endl;

    // ai_worker_args ai_args;
  
    /****fixed operation for ctrl+c****/
    struct sigaction sa;
    memset( &sa, 0, sizeof(sa) );
    sa.sa_handler = fun_sig;
    sigfillset(&sa.sa_mask);
    sigaction(SIGINT, &sa, NULL);


    std::cout << "starting "<< std::endl;
    // gnne_input_width = 320;
    // gnne_input_height = 320;
    // gnne_valid_width = 320;
    // gnne_valid_height = 240;
    // create thread for ai worker
    // std::thread thread_ds2(ai_worker, ai_args);
    std::thread thread_ds2(ai_worker);

    thread_ds2.join();

    return 0;
}
