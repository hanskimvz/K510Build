/* Copyright (c) 2022, Hans Kim
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
#include <string.h>
#include <stdlib.h>

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
#include <semaphore.h>
#include <sys/shm.h>

// using namespace std;

#include "../shared_mem_define.h"
int load_param(){
	FILE *fp = fopen(PARAM_FILENAME, "r");
	char* data;
	int len;

	// int shmid;
	// void *memory_segment = NULL;

	if(NULL == fp){
		printf("read %s:file no exist!\n",__func__);
		return -1;
	}
	fseek(fp, 0, SEEK_END);
	len = ftell(fp);
	fseek(fp, 0, SEEK_SET);
	data=(char *)malloc(len+5);
	fread(data, 1, len, fp);
	fclose(fp);

	// printf("%s", data);

	memcpy((char *)seg_param, data,  len+1);
	memcpy((char *)seg_param + len, "EOF\0", 4 );

	free(data);
	printf("param loaded from %s to shared memory\n",PARAM_FILENAME );
	return 0;

}


int main(int argc, char *argv[]) {
	printf("Init and preprocessing encoder and settings\n");
	mk_shared_memory(PROMPT_SHM_ID); 
	mk_shared_memory(PARAM_SHM_ID); 
	load_param();
	dettach_shared_memory();
		
}

// export PATH=$PATH:/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin
// riscv64-linux-g++ -M -fomit-frame-pointer -fno-strict-aliasing -fno-builtin -ffunction-sections -fdata-sections -DCFG_MAKEFILE -DTARGET_BOARD_TYPE_def=\"\" appinit.cpp -lpthread -g -o appinit
// riscv64-linux-g++ -M -fomit-frame-pointer appinit.cpp -lpthread -g -o appinit