# build locally
export PATH=$PATH:/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin

CROSS_COMPILE = riscv64-linux-
# CC=$(CROSS_COMPILE)gcc
CC	:= $(CROSS_COMPILE)gcc
C++	:= $(CROSS_COMPILE)g++
# OBJDUMP	:= $(CROSS_COMPILE)objdump
# OBJCOPY := $(CROSS_COMPILE)objcopy
# AR	:= $(CROSS_COMPILE)ar
# AS	:= $(CROSS_COMPILE)as
# LD	:= $(CROSS_COMPILE)gcc


TARGET = camera_param
OBJS = camera_param.c

all:
	${CC} ${OBJS} -Wall -lpthread -luv -lvenc -g -o ${TARGET}
	
	@echo "Compile done."
clean:
	@rm -f *.o ${TARGET}
	@echo "Clean done."
