#include "./websocket.h"
#include <iostream>
#include <thread>
#include <atomic>
#include <signal.h>
#include <sys/shm.h>

#define SH_MEMSIZE  1048576
#define SH_KEY      0xF6085
int shmid;
void *memory_segment = NULL;


// unsigned int procSnapshot(uint16_t wp, uint16_t fsize){
//     char rs[16];
//     memcpy(rs, (unsigned char *)memory_segment, 1);
//     unsigned char p_x = rs[0];
//     wp = (uint32_t)p_x * 524288;

//     memcpy(rs, (unsigned char *)memory_segment+wp, 16);
//     fsize=  rs[12]  | (rs[13]<<8)&0xFF | (rs[14]<<16)&0xFF | (rs[15] <<24)&0xFF;
//     printf("page:%d, fsize:%d, wp:%d", p_x, fsize, wp);

//     return 0;

// }

class Server {
public:
    struct CMDConnData {
        bool login;
    };
    using WSServer = websocket::WSServer<Server, CMDConnData>;
    using WSConn = WSServer::Connection;

    void run() {
        if (!wsserver.init("0.0.0.0", 1234)) {
            std::cout << "wsserver init failed: " << wsserver.getLastError() << std::endl;
            return;
        }
        admincmd_help = "Server help:\n"
                        "login password\n"
                        "echo str\n"
                        "stop\n";

        running = true;
        ws_thr = std::thread([this]() {
            while (running.load(std::memory_order_relaxed)) {
                wsserver.poll(this);
                std::this_thread::yield();
            }
        });

        std::cout << "Server running..." << std::endl;
        ws_thr.join();
        std::cout << "Server stopped..." << std::endl;
    }

    void stop() { 
        running = false; 
    }

    // called when a new websocket connection is about to open
    // optional: origin, protocol, extensions will be nullptr if not exist in the request headers
    // optional: fill resp_protocol[resp_protocol_size] to add protocol to response headers
    // optional: fill resp_extensions[resp_extensions_size] to add extensions to response headers
    // return true if accept this new connection
    bool onWSConnect(WSConn& conn, const char* request_uri, const char* host, const char* origin, const char* protocol,
                   const char* extensions, char* resp_protocol, uint32_t resp_protocol_size, char* resp_extensions,
                   uint32_t resp_extensions_size) {
        int i;
        
        struct sockaddr_in addr;
        conn.getPeername(addr);
        std::cout << "ws connection from: " << inet_ntoa(addr.sin_addr) << ":" << ntohs(addr.sin_port) << std::endl;
        std::cout << "request_uri: " << request_uri << std::endl;
        printf("hans says:%s\n", request_uri);
        std::cout << "host: " << host << std::endl;
        if (origin) {
            std::cout << "origin: " << origin << std::endl;
        }
        if (protocol) {
            std::cout << "protocol: " << protocol << std::endl;
        }
        if (extensions) {
            std::cout << "extensions: " << extensions << std::endl;
        }

        // if (strcmp(request_uri, "/live") == 0){
        //     unsigned char rs[32];
        //     unsigned int wp;
        //     memcpy(rs, (char *)memory_segment, 1);
        //     printf("rs[0]:%d  ", rs[0]);
        //     wp = (unsigned int)rs[0] * 524288;

        //     memcpy(rs, (char *)memory_segment + wp, 32);
        //     unsigned int fsize=  (unsigned int)rs[16]  | ((unsigned int)rs[17]<<8) | ((unsigned int)rs[18]<<16) | ((unsigned int)rs[19] <<24);
        //     printf("wp:%d, fsize:%d\n", wp, fsize);

        //     conn.send(websocket::OPCODE_BINARY, (const uint8_t*)memory_segment + wp + 32, fsize);
        // }
        return true;
    }

    // called when a websocket connection is closed
    // status_code 1005 means no status code in the close msg
    // status_code 1006 means not a clean close(tcp connection closed without a close msg)
    void onWSClose(WSConn& conn, uint16_t status_code, const char* reason) {
        std::cout << "ws close, status_code: " << status_code << ", reason: " << reason << std::endl;
    }

    // onWSMsg is used if RecvSegment == false(by default), called when a whole msg is received
    void onWSMsg(WSConn& conn, uint8_t opcode, const uint8_t* payload, uint32_t pl_len) {
        if (opcode == websocket::OPCODE_PING) {
            conn.send(websocket::OPCODE_PONG, payload, pl_len);
            return;
        }
        if (opcode != websocket::OPCODE_TEXT) {
            conn.close(1003, "not text msg");
            return;
        }
        const char* data = (const char*)payload;
        const char* data_end = data + pl_len;
        char buf[4096] = {0};
        const char* argv[4096];
        char* out = buf + 1;
        int argc = 0;
        bool in_quote = false;
        bool single_quote = false;
        while (data < data_end) {
            char ch = *data++;
            if (!in_quote) {
                if (ch == ' ') *out++ = 0;
                else {
                    if (*(out - 1) == 0) argv[argc++] = out;
                    if (ch == '\'')
                        in_quote = single_quote = true;
                    else if (ch == '"')
                        in_quote = true;
                    else if (ch == '\\')
                        *out++ = *data++;
                    else
                        *out++ = ch;
                }
            }
            else {
                if (single_quote) {
                    if (ch == '\'')
                        in_quote = single_quote = false;
                    else
                        *out++ = ch;
                }
                else {
                    if (ch == '"')
                        in_quote = false;
                    else if (ch == '\\' && (*data == '\\' || *data == '"'))
                        *out++ = *data++;
                    else
                        *out++ = ch;
                }
            }
        }
        if (argc) {
            *out = 0;
            std::string resp = onCMD(conn.user_data, argc, argv);
            if (resp.size()) {
                conn.send(websocket::OPCODE_TEXT, (const uint8_t*)resp.data(), resp.size());
            }
            if (strcmp(resp.data(), "live") == 0) {
                unsigned char rs[32];
                unsigned int wp;
                memcpy(rs, (char *)memory_segment, 1);
                printf("rs[0]:%d  ", rs[0]);
                wp = (unsigned int)rs[0] * 524288;

                memcpy(rs, (char *)memory_segment + wp, 32);
                unsigned int fsize=  (unsigned int)rs[16]  | ((unsigned int)rs[17]<<8) | ((unsigned int)rs[18]<<16) | ((unsigned int)rs[19] <<24);
                printf("wp:%d, fsize:%d\n", wp, fsize);

                conn.send(websocket::OPCODE_BINARY, (const uint8_t*)memory_segment + wp + 32, fsize);
            }
            
        }
    }

    // onWSSegment is used if RecvSegment == true, called when a segment is received
    // pl_start_idx: index in the whole msg for the 1st byte of payload
    // fin: whether it's the last segment
    void onWSSegment(WSConn& conn, uint8_t opcode, const uint8_t* payload, uint32_t pl_len, uint32_t pl_start_idx,
                   bool fin) {
        std::cout << "error: onWSSegment should not be called" << std::endl;
    }

private:
    std::string onCMD(CMDConnData& conn, int argc, const char** argv) {
        std::string resp;
        if (!strcmp(argv[0], "help")) {
            resp = admincmd_help;
        }
        else if (strcmp(argv[0], "live") == 0){
            resp ="live";
        }

        else if (!strcmp(argv[0], "login")) {
            if (argc < 2 || strcmp(argv[1], "123456")) {
                resp = "wrong password";
            }
            else {
                conn.login = true;
                resp = "login success";
            }
            
        }
        else if (!conn.login) {
            resp = "must login first";
        }
        else if (!strcmp(argv[0], "echo")) {
            if (argc >= 2) resp = std::string(argv[1]);
        }
        else if (!strcmp(argv[0], "stop")) {
            stop();
        }
        else {
            resp = "invalid cmd, check help";
        }

        return resp;
    }

private:
    WSServer wsserver;
    std::thread ws_thr;
    std::string admincmd_help;
    std::atomic<bool> running;
};


Server server;

void my_handler(int s) {
  server.stop();
}

int main(int argc, char** argv) {
    struct sigaction sigIntHandler;

    if((shmid=shmget(SH_KEY, SH_MEMSIZE, IPC_CREAT|0666))==-1){
        printf("shmget failed\n");
        return -1;
    }
    else {
        printf("shmget ok\n");
    }

    if((memory_segment = shmat(shmid,NULL,0))==(void*)-1){
        printf("shmat failed\n");
        return -1;
    }
    else {
        printf("shmat ok\n");
    }

    


    sigIntHandler.sa_handler = my_handler;
    sigemptyset(&sigIntHandler.sa_mask);
    sigIntHandler.sa_flags = 0;

    sigaction(SIGINT, &sigIntHandler, NULL);

    server.run();


    // if(shmdt(shmid, IPC_RMID, 0) == -1) {
    //     perror("Shmctl failed");
    // }
    // else {
    //     printf("Shared memory end");
    // }	
}
