/*


*/

#include <sys/shm.h>

#define PROMPT_SHM_ID       0xF8080
#define PROMPT_SHM_SIZE        1024   // 2^10
#define PARAM_SHM_ID        0xF8081
#define PARAM_SHM_SIZE        65536   // 2^16
#define FRAME_SHM_ID_0      0xF8082
#define FRAME_SHM_SIZE_0    1048576   // 2^20
#define FRAME_SHM_ID_1      0xF8083
#define FRAME_SHM_SIZE_1    1048576   // 2^20
#define SNAPSHOT_SHM_ID     0xF8084
#define SNAPSHOT_SHM_SIZE   1048576   // 2^20
#define VCA_SHM_ID          0xF8085
#define VCA_SHM_SIZE           4096   // 2^12

#define PARAM_FILENAME       "/root/data/param.json"


int shmid_prompt;
int shmid_param;
int shmid_frame0;
int shmid_frame1;
int shmid_snapshot;
int shmid_vca;

void *seg_prompt = NULL;
void *seg_param = NULL;
void *seg_frame0 = NULL;
void *seg_frame1 = NULL;
void *seg_snapshot = NULL;
void *seg_vca = NULL;

int mk_shared_memory(unsigned int idx);
int dettach_shared_memory();

int mk_shared_memory(unsigned int idx) {
	
    if (idx == PROMPT_SHM_ID || idx == 0) {
        if((shmid_prompt = shmget(PROMPT_SHM_ID, PROMPT_SHM_SIZE, IPC_CREAT|0666))==-1){
            printf("shmget failed: %08x\n", PROMPT_SHM_ID);
            return -1;
        }
        if((seg_prompt = shmat(shmid_prompt, NULL, 0))==(void*)-1){
            printf("shmat failed: %08x\n", PROMPT_SHM_ID);
            return -1;
        }
        printf("shared memory PROMPT_SHM key:%08x. id:%d, size:%d created\n", PROMPT_SHM_ID, shmid_prompt, PROMPT_SHM_SIZE);
    }

    if (idx == PARAM_SHM_ID || idx == 0) {
        if((shmid_param = shmget(PARAM_SHM_ID, PARAM_SHM_SIZE, IPC_CREAT|0666))==-1){
            printf("shmget failed: %08x\n", PARAM_SHM_ID);
            return -1;
        }
        if((seg_param = shmat(shmid_param, NULL, 0))==(void*)-1){
            printf("shmat failed: %08x\n", PARAM_SHM_ID);
            return -1;
        }
	    printf("shared memory PARAM_SHM key:%08x. id:%d, size:%d created\n", PARAM_SHM_ID, shmid_param, PARAM_SHM_SIZE);
    }

    if (idx == FRAME_SHM_ID_0 || idx == 0) {
        if((shmid_frame0 = shmget(FRAME_SHM_ID_0, FRAME_SHM_SIZE_0, IPC_CREAT|0666))==-1){
            printf("shmget failed: %08x\n", FRAME_SHM_ID_0);
            return -1;
        }
        if((seg_frame0 = shmat(shmid_frame0, NULL, 0))==(void*)-1){
            printf("shmat failed: %08x\n", FRAME_SHM_ID_0);
            return -1;
        }
        printf("shared memory FRAME0_SHM key:%08x. id:%d, size:%d created\n", FRAME_SHM_ID_0, shmid_frame0, FRAME_SHM_SIZE_0);
    }
    
    if (idx == FRAME_SHM_ID_1 || idx == 0) {
        if((shmid_frame1 = shmget(FRAME_SHM_ID_1, FRAME_SHM_SIZE_1, IPC_CREAT|0666))==-1){
            printf("shmget failed: %08x\n", FRAME_SHM_ID_1);
            return -1;
        }
        if((seg_frame1 = shmat(shmid_frame1, NULL, 0))==(void*)-1){
            printf("shmat failed: %08x\n", FRAME_SHM_ID_1);
            return -1;
        }
        printf("shared memory FRAME1_SHM key:%08x. id:%d, size:%d created\n", FRAME_SHM_ID_1, shmid_frame1, FRAME_SHM_SIZE_1);
    }

    if (idx == SNAPSHOT_SHM_ID || idx == 0) {
        if((shmid_snapshot = shmget(SNAPSHOT_SHM_ID, SNAPSHOT_SHM_SIZE, IPC_CREAT|0666))==-1){
            printf("shmget failed: %08x\n", SNAPSHOT_SHM_ID);
            return -1;
        }
        if((seg_snapshot = shmat(shmid_snapshot, NULL, 0))==(void*)-1){
            printf("shmat failed: %08x\n", SNAPSHOT_SHM_ID);
            return -1;
        }
        printf("shared memory FRAME2_SHM key:%08x. id:%d, size:%d created\n", SNAPSHOT_SHM_ID, shmid_snapshot, SNAPSHOT_SHM_SIZE);
    }

	if (idx == VCA_SHM_ID || idx == 0) {
        if((shmid_vca = shmget(VCA_SHM_ID, VCA_SHM_SIZE, IPC_CREAT|0666))==-1){
            printf("shmget failed: %08x\n", VCA_SHM_ID);
            return -1;
        }
        if((seg_vca = shmat(shmid_vca, NULL, 0))==(void*)-1){
            printf("shmat failed: %08x\n", VCA_SHM_ID);
            return -1;
        }
        printf("shared memory VCA_SHM key:%08x. id:%d, size:%d created\n", VCA_SHM_ID, shmid_vca, VCA_SHM_SIZE);
    }
    return 0;

}


int dettach_shared_memory(){
	if(shmdt(seg_prompt) == -1) {
        perror("Shmdt prompt failed\n");
    }
    else {
        printf("Shared memory prompt dispatch end\n");
    }	

	if(shmdt(seg_param) == -1) {
        perror("Shmdt param failed\n");
    }
    else {
        printf("Shared memory  param dispatch end\n");
    }	

	if(shmdt(seg_frame0) == -1) {
        perror("Shmdt frame0 failed\n");
    }
    else {
        printf("Shared memory frame0  dispatch end\n");
    }	

	if(shmdt(seg_frame1) == -1) {
        perror("Shmdt frame1 failed\n");
    }
    else {
        printf("Shared memory frame1  dispatch end\n");
    }	
	
	if(shmdt(seg_snapshot) == -1) {
        perror("Shmdt snapshot failed\n");
    }
    else {
        printf("Shared memory snapshot  dispatch end\n");
    }	

	if(shmdt(seg_vca) == -1) {
        perror("Shmdt vca failed\n");
    }
    else {
        printf("Shared memory vca  dispatch end\n");
    }	
}