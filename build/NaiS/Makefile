export PATH=$PATH:/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin
CROSS_COMPILE := riscv64-linux-

CC	:= $(CROSS_COMPILE)gcc
C++	:= $(CROSS_COMPILE)g++
OBJDUMP	:= $(CROSS_COMPILE)objdump
OBJCOPY := $(CROSS_COMPILE)objcopy
AR	:= $(CROSS_COMPILE)ar
AS	:= $(CROSS_COMPILE)as
LD	:= $(CROSS_COMPILE)gcc

# CFLAGS = \
# 	-fomit-frame-pointer -fno-strict-aliasing -fno-builtin \
# 	-ffunction-sections -fdata-sections \
# 	-DCFG_MAKEFILE -DTARGET_BOARD_TYPE_def=\"$(BR2_TARGET_BOARD_TYPE)\"

CFLAGS = \
	-fomit-frame-pointer -fno-strict-aliasing -fno-builtin \
	-ffunction-sections -fdata-sections 



OBJ ?= appinit

# INCLUDE_PATH = /build/opencv4-4.5.2/modules/core/include


$(OBJ): appinit.cpp 
	$(C++)  $^ -lpthread -g -o $@

# $(OBJ): main.cpp video_app.cc G711Codec.cpp
# 	$(C++) $(CFLAGS) $^ -L ./ -Wl,-Bdynamic -lvenc -L ./ -Wl,-Bstatic -llive555 -L ./ -Wl,-Bdynamic -lmediactl -L ./ -Wl,-Bdynamic -lvideo -L ./ -Wl,-Bdynamic -lasound -lstdc++ -Wl,-rpath . -lpthread -g -o $@

# -Wl,[링크 옵션들] 옵션 : gcc를 거치지 않고 바로 링크에게 옵션을 정해주고자 할 때 사용한다.
# -L[라이브러리 디렉토리] 옵션 : 라이브러리를 찾을 디렉토리를 지정한다.



clean:
	rm -f *.o
	rm -f *.d
	rm -f $(OBJ)