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

#include "cJSON.h"
#include "types.h"
#include "enc_interface.h"
#include "isp_video.h"
#include "VideoStreamer.hh"
#include "video_app.h"
#include "media_ctl.h"
#include "IRtspServer.h"
#include "alsa/asoundlib.h"
#include "G711Codec.h"


//#define ISP_OUTPUT_DUMP 1
#define TEST_ISP        0

#define ISP_ADDR_BUFFER_CNT  22
#define V4L2_INVALID_INDEX 0xffff
#define V4L2_REPEAT_FLAG 0x80000000

#define SHARE_MEMORY_DEV 	"/dev/k510-share-memory"
#define DEV_NAME_DDR 		"/dev/mem"
// #define DEV_NAME_ISP 		"/dev/test-isp"
// #define DEV_NAME_V4L2 		"/dev/video3"
#define REAL_CONF_FILENAME 	"video_real.conf"
#define SETTING_FILENAME 	"setting.conf"
#define VIDEO_CONF_FILENAME "video_sample.conf"
#define JPEG_FILENAME 		"test.jpg"

#define MEMORY_TEST_BLOCK_ALIGN 4096        /* align 4k for mmap */
#define SHARE_MEMORY_ALLOC          _IOWR('m', 1, unsigned long)
#define SHARE_MEMORY_ALIGN_ALLOC    _IOWR('m', 2, unsigned long)
#define SHARE_MEMORY_FREE           _IOWR('m', 3, unsigned long)
#define SHARE_MEMORY_SHOW           _IOWR('m', 4, unsigned long)

#define ISP_CMD_ISP_RESET           _IOWR('q', 20, unsigned long)

#define DDR_CTRL_REG_BASE 0x198000000
#define NOC_QOS_REG_BASE  0x199900000
#define MAILBOX_REG_BASE  0x1970E0000

#define ALSA_BUFFER_SIZE_MAX (131072) //(0x20000)
#define MIN(a,b) ((a) > (b) ? (b) : (a))

static int received_sigterm = 0;
typedef std::vector<EncROICfg>    ENC_ROI_CFG_ARRAY;


struct share_memory_alloc_align_args {
    unsigned int size;
    unsigned int alignment;
    unsigned int phyAddr;
};

typedef struct {
	void *vaddr;
	long paddr;
	unsigned int length;
} V4L2_BUF;

typedef struct {
	int addr;
} V4L2_REV;

typedef struct {
	int fd_isp;
	int fd_ddr;
	int fd_share_memory;
	int *fd_v4l2;
	int *isp_rp;
	int *isp_wp;
	long (*isp_addr)[ISP_ADDR_BUFFER_CNT];
	int *isp_pic_cnt;
	V4L2_BUF **v4l2_buf;
	V4L2_REV **v4l2_rev;
	sem_t *    pSemGetData;
	int *v4l2_rp;
	int *v4l2_wp;
	int *v4l2_pic_cnt;
	int *total_out_size;
	int *rtsp_buf_wp;
	void **isp_buf_vaddr;
	unsigned int *isp_buf_paddr;
	unsigned int *isp_buf_size;
	int *enable_isp;
	int *enable_rtsp;
	int *enable_v4l2;
	long *yuv_phyAddr;
	void **yuv_vAddr;
	unsigned int *yuv_size;
	unsigned long int *start_time;
	void **out_buffer;
	unsigned int *stream_size;
	unsigned int *out_pic;
	unsigned char *framerate;
	long *stream_phyAddr;
	FILE **in_file;
	FILE **out_file;
	EncoderHandle **hEnc;
	unsigned int reg_QoS_ctrl0;
	unsigned int reg_QoS_ctrl1;
	unsigned int reg_QoS_ctrl2;
	unsigned int reg_h264_bw;
	unsigned int reg_h264_mode;
	unsigned int reg_isp_pri;
	unsigned int reg_isp_bw;
	unsigned int reg_isp_mode;
	unsigned int reg_ddr_cli;

	long *shared_phyAddr;
	void **shared_vAddr;
	unsigned int *shared_size;
	unsigned int *exp;
	unsigned int *agc;
	int *stride;
	int *width;
	int *height;
	int *input_frames;
	pthread_t *isp_thread;
	pthread_t *v4l2_thread;
	pthread_t *encode_thread;
	int start;
	int end_encode;
	char *conf_filename;
	struct video_info dev_info[2];
	IRtspServerEX **pRtspServer;
	int *rtspPort; // hans
	char **rtspStreamName; // hans
	char **roi_filename;
	ENC_ROI_CFG_ARRAY*   aryEncRoiCfg;
	int*                 nLTRFreq;//Specifies the Long Term reference picture refresh frequency in number of frames
	EncSettings *Cfg;
	int *ch_en;
	char **infilename;
	char **outfilename;
	int thread_rtsp_en;
	int thread_isp_en;
	int thread_v4l2_en;
	char **dev_name;
	int *output_frames;
	int *encoding;
	int *ch;
	int ch_cnt;
	int isp_enabled;
	int v4l2_enabled;
	uint32_t *repeat;
	uint32_t *repeat_en;
	uint32_t *drop;
	uint32_t *drop_en;
	uint32_t *framerate_mod;
	int *set_ae;
	unsigned char *out_framerate;
	int video_enabled;
	int ae_enable;
	int setQos;

	/* audio */
	snd_pcm_t *pcmp;
	int audio_ch_cnt;
	int audio_sample_rate;
	snd_pcm_uframes_t period_size;
	snd_pcm_format_t audio_format;
	int audioEncType;
	char *audio_buffer;
	int audio_frame_size;
	int audio_size;
	char *audio_device;
	int audio_processing;
	int audio_enabled;
	pthread_t audio_thread;
} MainContext;

int parse_setting();
int procVideoEncode();
int procRtspSet();
void set_QoS();
void endof_encode();
void exit_handler(int sig) ;
int init_audio(int nSampleRate);
void *encode_ch(void *arg);
int init_v4l2();
int parse_conf();

// static void DoEncRoi(EncoderHandle *hEnc,const ENC_ROI_CFG_ARRAY& aryEncRoiCfg);




// static unsigned int alloc_memory(int fd_share_memory, unsigned int size);
// // static int get_yuv(MainContext *pCtx, char *infilename, int channel);
// static void write_output(MainContext *pCtx, FILE *out_file, EncOutputStream *src);
// static unsigned long int get_time();
// // static void *isp_output(void *arg);
// static void enqueue_buf(unsigned char index, int channel);
// static void *v4l2_output(void *arg);

// int free_context(void *arg);



// #if TEST_ISP
// static int init_isp();
// #endif





// int alloc_context(void *arg);
// // int parse_cmd(int argc, char *argv[]);


extern MainContext Ctx;
extern MainContext *pCtx;
// extern MainContext *pCtx=&Ctx;
