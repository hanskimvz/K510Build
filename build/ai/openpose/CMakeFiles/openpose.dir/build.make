# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.15

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/cmake

# The command to remove a file.
RM = /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai

# Include any dependencies generated for this target.
include openpose/CMakeFiles/openpose.dir/depend.make

# Include the progress variables for this target.
include openpose/CMakeFiles/openpose.dir/progress.make

# Include the compile flags for this target's objects.
include openpose/CMakeFiles/openpose.dir/flags.make

openpose/CMakeFiles/openpose.dir/main.cc.o: openpose/CMakeFiles/openpose.dir/flags.make
openpose/CMakeFiles/openpose.dir/main.cc.o: openpose/main.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --progress-dir=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object openpose/CMakeFiles/openpose.dir/main.cc.o"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/openpose && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/openpose.dir/main.cc.o -c /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/openpose/main.cc

openpose/CMakeFiles/openpose.dir/main.cc.i: cmake_force
	@echo "Preprocessing CXX source to CMakeFiles/openpose.dir/main.cc.i"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/openpose && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/openpose/main.cc > CMakeFiles/openpose.dir/main.cc.i

openpose/CMakeFiles/openpose.dir/main.cc.s: cmake_force
	@echo "Compiling CXX source to assembly CMakeFiles/openpose.dir/main.cc.s"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/openpose && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/openpose/main.cc -o CMakeFiles/openpose.dir/main.cc.s

openpose/CMakeFiles/openpose.dir/cv2_utils.cc.o: openpose/CMakeFiles/openpose.dir/flags.make
openpose/CMakeFiles/openpose.dir/cv2_utils.cc.o: openpose/cv2_utils.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --progress-dir=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object openpose/CMakeFiles/openpose.dir/cv2_utils.cc.o"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/openpose && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/openpose.dir/cv2_utils.cc.o -c /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/openpose/cv2_utils.cc

openpose/CMakeFiles/openpose.dir/cv2_utils.cc.i: cmake_force
	@echo "Preprocessing CXX source to CMakeFiles/openpose.dir/cv2_utils.cc.i"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/openpose && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/openpose/cv2_utils.cc > CMakeFiles/openpose.dir/cv2_utils.cc.i

openpose/CMakeFiles/openpose.dir/cv2_utils.cc.s: cmake_force
	@echo "Compiling CXX source to assembly CMakeFiles/openpose.dir/cv2_utils.cc.s"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/openpose && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/openpose/cv2_utils.cc -o CMakeFiles/openpose.dir/cv2_utils.cc.s

openpose/CMakeFiles/openpose.dir/pafprocess.cc.o: openpose/CMakeFiles/openpose.dir/flags.make
openpose/CMakeFiles/openpose.dir/pafprocess.cc.o: openpose/pafprocess.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --progress-dir=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object openpose/CMakeFiles/openpose.dir/pafprocess.cc.o"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/openpose && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/openpose.dir/pafprocess.cc.o -c /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/openpose/pafprocess.cc

openpose/CMakeFiles/openpose.dir/pafprocess.cc.i: cmake_force
	@echo "Preprocessing CXX source to CMakeFiles/openpose.dir/pafprocess.cc.i"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/openpose && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/openpose/pafprocess.cc > CMakeFiles/openpose.dir/pafprocess.cc.i

openpose/CMakeFiles/openpose.dir/pafprocess.cc.s: cmake_force
	@echo "Compiling CXX source to assembly CMakeFiles/openpose.dir/pafprocess.cc.s"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/openpose && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/openpose/pafprocess.cc -o CMakeFiles/openpose.dir/pafprocess.cc.s

openpose/CMakeFiles/openpose.dir/openpose.cc.o: openpose/CMakeFiles/openpose.dir/flags.make
openpose/CMakeFiles/openpose.dir/openpose.cc.o: openpose/openpose.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --progress-dir=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object openpose/CMakeFiles/openpose.dir/openpose.cc.o"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/openpose && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/openpose.dir/openpose.cc.o -c /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/openpose/openpose.cc

openpose/CMakeFiles/openpose.dir/openpose.cc.i: cmake_force
	@echo "Preprocessing CXX source to CMakeFiles/openpose.dir/openpose.cc.i"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/openpose && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/openpose/openpose.cc > CMakeFiles/openpose.dir/openpose.cc.i

openpose/CMakeFiles/openpose.dir/openpose.cc.s: cmake_force
	@echo "Compiling CXX source to assembly CMakeFiles/openpose.dir/openpose.cc.s"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/openpose && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/openpose/openpose.cc -o CMakeFiles/openpose.dir/openpose.cc.s

openpose/CMakeFiles/openpose.dir/__/common/k510_drm.c.o: openpose/CMakeFiles/openpose.dir/flags.make
openpose/CMakeFiles/openpose.dir/__/common/k510_drm.c.o: common/k510_drm.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --progress-dir=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object openpose/CMakeFiles/openpose.dir/__/common/k510_drm.c.o"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/openpose && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-gcc --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/openpose.dir/__/common/k510_drm.c.o   -c /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/common/k510_drm.c

openpose/CMakeFiles/openpose.dir/__/common/k510_drm.c.i: cmake_force
	@echo "Preprocessing C source to CMakeFiles/openpose.dir/__/common/k510_drm.c.i"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/openpose && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-gcc --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/common/k510_drm.c > CMakeFiles/openpose.dir/__/common/k510_drm.c.i

openpose/CMakeFiles/openpose.dir/__/common/k510_drm.c.s: cmake_force
	@echo "Compiling C source to assembly CMakeFiles/openpose.dir/__/common/k510_drm.c.s"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/openpose && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-gcc --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/common/k510_drm.c -o CMakeFiles/openpose.dir/__/common/k510_drm.c.s

openpose/CMakeFiles/openpose.dir/__/common/v4l2.c.o: openpose/CMakeFiles/openpose.dir/flags.make
openpose/CMakeFiles/openpose.dir/__/common/v4l2.c.o: common/v4l2.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --progress-dir=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object openpose/CMakeFiles/openpose.dir/__/common/v4l2.c.o"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/openpose && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-gcc --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/openpose.dir/__/common/v4l2.c.o   -c /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/common/v4l2.c

openpose/CMakeFiles/openpose.dir/__/common/v4l2.c.i: cmake_force
	@echo "Preprocessing C source to CMakeFiles/openpose.dir/__/common/v4l2.c.i"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/openpose && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-gcc --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/common/v4l2.c > CMakeFiles/openpose.dir/__/common/v4l2.c.i

openpose/CMakeFiles/openpose.dir/__/common/v4l2.c.s: cmake_force
	@echo "Compiling C source to assembly CMakeFiles/openpose.dir/__/common/v4l2.c.s"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/openpose && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-gcc --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/common/v4l2.c -o CMakeFiles/openpose.dir/__/common/v4l2.c.s

openpose/CMakeFiles/openpose.dir/__/common/buf_mgt.cc.o: openpose/CMakeFiles/openpose.dir/flags.make
openpose/CMakeFiles/openpose.dir/__/common/buf_mgt.cc.o: common/buf_mgt.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --progress-dir=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object openpose/CMakeFiles/openpose.dir/__/common/buf_mgt.cc.o"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/openpose && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/openpose.dir/__/common/buf_mgt.cc.o -c /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/common/buf_mgt.cc

openpose/CMakeFiles/openpose.dir/__/common/buf_mgt.cc.i: cmake_force
	@echo "Preprocessing CXX source to CMakeFiles/openpose.dir/__/common/buf_mgt.cc.i"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/openpose && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/common/buf_mgt.cc > CMakeFiles/openpose.dir/__/common/buf_mgt.cc.i

openpose/CMakeFiles/openpose.dir/__/common/buf_mgt.cc.s: cmake_force
	@echo "Compiling CXX source to assembly CMakeFiles/openpose.dir/__/common/buf_mgt.cc.s"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/openpose && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/common/buf_mgt.cc -o CMakeFiles/openpose.dir/__/common/buf_mgt.cc.s

# Object files for target openpose
openpose_OBJECTS = \
"CMakeFiles/openpose.dir/main.cc.o" \
"CMakeFiles/openpose.dir/cv2_utils.cc.o" \
"CMakeFiles/openpose.dir/pafprocess.cc.o" \
"CMakeFiles/openpose.dir/openpose.cc.o" \
"CMakeFiles/openpose.dir/__/common/k510_drm.c.o" \
"CMakeFiles/openpose.dir/__/common/v4l2.c.o" \
"CMakeFiles/openpose.dir/__/common/buf_mgt.cc.o"

# External object files for target openpose
openpose_EXTERNAL_OBJECTS =

openpose/openpose: openpose/CMakeFiles/openpose.dir/main.cc.o
openpose/openpose: openpose/CMakeFiles/openpose.dir/cv2_utils.cc.o
openpose/openpose: openpose/CMakeFiles/openpose.dir/pafprocess.cc.o
openpose/openpose: openpose/CMakeFiles/openpose.dir/openpose.cc.o
openpose/openpose: openpose/CMakeFiles/openpose.dir/__/common/k510_drm.c.o
openpose/openpose: openpose/CMakeFiles/openpose.dir/__/common/v4l2.c.o
openpose/openpose: openpose/CMakeFiles/openpose.dir/__/common/buf_mgt.cc.o
openpose/openpose: openpose/CMakeFiles/openpose.dir/build.make
openpose/openpose: openpose/CMakeFiles/openpose.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --progress-dir=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Linking CXX executable openpose"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/openpose && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/openpose.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
openpose/CMakeFiles/openpose.dir/build: openpose/openpose

.PHONY : openpose/CMakeFiles/openpose.dir/build

openpose/CMakeFiles/openpose.dir/clean:
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/openpose && $(CMAKE_COMMAND) -P CMakeFiles/openpose.dir/cmake_clean.cmake
.PHONY : openpose/CMakeFiles/openpose.dir/clean

openpose/CMakeFiles/openpose.dir/depend:
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/openpose /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/openpose /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/openpose/CMakeFiles/openpose.dir/DependInfo.cmake
.PHONY : openpose/CMakeFiles/openpose.dir/depend
