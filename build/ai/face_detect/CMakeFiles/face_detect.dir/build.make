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
include face_detect/CMakeFiles/face_detect.dir/depend.make

# Include the progress variables for this target.
include face_detect/CMakeFiles/face_detect.dir/progress.make

# Include the compile flags for this target's objects.
include face_detect/CMakeFiles/face_detect.dir/flags.make

face_detect/CMakeFiles/face_detect.dir/main.cc.o: face_detect/CMakeFiles/face_detect.dir/flags.make
face_detect/CMakeFiles/face_detect.dir/main.cc.o: face_detect/main.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --progress-dir=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object face_detect/CMakeFiles/face_detect.dir/main.cc.o"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_detect && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/face_detect.dir/main.cc.o -c /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_detect/main.cc

face_detect/CMakeFiles/face_detect.dir/main.cc.i: cmake_force
	@echo "Preprocessing CXX source to CMakeFiles/face_detect.dir/main.cc.i"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_detect && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_detect/main.cc > CMakeFiles/face_detect.dir/main.cc.i

face_detect/CMakeFiles/face_detect.dir/main.cc.s: cmake_force
	@echo "Compiling CXX source to assembly CMakeFiles/face_detect.dir/main.cc.s"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_detect && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_detect/main.cc -o CMakeFiles/face_detect.dir/main.cc.s

face_detect/CMakeFiles/face_detect.dir/cv2_utils.cc.o: face_detect/CMakeFiles/face_detect.dir/flags.make
face_detect/CMakeFiles/face_detect.dir/cv2_utils.cc.o: face_detect/cv2_utils.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --progress-dir=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object face_detect/CMakeFiles/face_detect.dir/cv2_utils.cc.o"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_detect && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/face_detect.dir/cv2_utils.cc.o -c /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_detect/cv2_utils.cc

face_detect/CMakeFiles/face_detect.dir/cv2_utils.cc.i: cmake_force
	@echo "Preprocessing CXX source to CMakeFiles/face_detect.dir/cv2_utils.cc.i"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_detect && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_detect/cv2_utils.cc > CMakeFiles/face_detect.dir/cv2_utils.cc.i

face_detect/CMakeFiles/face_detect.dir/cv2_utils.cc.s: cmake_force
	@echo "Compiling CXX source to assembly CMakeFiles/face_detect.dir/cv2_utils.cc.s"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_detect && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_detect/cv2_utils.cc -o CMakeFiles/face_detect.dir/cv2_utils.cc.s

face_detect/CMakeFiles/face_detect.dir/anchors_320.cc.o: face_detect/CMakeFiles/face_detect.dir/flags.make
face_detect/CMakeFiles/face_detect.dir/anchors_320.cc.o: face_detect/anchors_320.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --progress-dir=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object face_detect/CMakeFiles/face_detect.dir/anchors_320.cc.o"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_detect && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/face_detect.dir/anchors_320.cc.o -c /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_detect/anchors_320.cc

face_detect/CMakeFiles/face_detect.dir/anchors_320.cc.i: cmake_force
	@echo "Preprocessing CXX source to CMakeFiles/face_detect.dir/anchors_320.cc.i"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_detect && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_detect/anchors_320.cc > CMakeFiles/face_detect.dir/anchors_320.cc.i

face_detect/CMakeFiles/face_detect.dir/anchors_320.cc.s: cmake_force
	@echo "Compiling CXX source to assembly CMakeFiles/face_detect.dir/anchors_320.cc.s"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_detect && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_detect/anchors_320.cc -o CMakeFiles/face_detect.dir/anchors_320.cc.s

face_detect/CMakeFiles/face_detect.dir/anchors_640.cc.o: face_detect/CMakeFiles/face_detect.dir/flags.make
face_detect/CMakeFiles/face_detect.dir/anchors_640.cc.o: face_detect/anchors_640.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --progress-dir=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object face_detect/CMakeFiles/face_detect.dir/anchors_640.cc.o"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_detect && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/face_detect.dir/anchors_640.cc.o -c /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_detect/anchors_640.cc

face_detect/CMakeFiles/face_detect.dir/anchors_640.cc.i: cmake_force
	@echo "Preprocessing CXX source to CMakeFiles/face_detect.dir/anchors_640.cc.i"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_detect && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_detect/anchors_640.cc > CMakeFiles/face_detect.dir/anchors_640.cc.i

face_detect/CMakeFiles/face_detect.dir/anchors_640.cc.s: cmake_force
	@echo "Compiling CXX source to assembly CMakeFiles/face_detect.dir/anchors_640.cc.s"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_detect && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_detect/anchors_640.cc -o CMakeFiles/face_detect.dir/anchors_640.cc.s

face_detect/CMakeFiles/face_detect.dir/retinaface.cc.o: face_detect/CMakeFiles/face_detect.dir/flags.make
face_detect/CMakeFiles/face_detect.dir/retinaface.cc.o: face_detect/retinaface.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --progress-dir=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object face_detect/CMakeFiles/face_detect.dir/retinaface.cc.o"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_detect && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/face_detect.dir/retinaface.cc.o -c /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_detect/retinaface.cc

face_detect/CMakeFiles/face_detect.dir/retinaface.cc.i: cmake_force
	@echo "Preprocessing CXX source to CMakeFiles/face_detect.dir/retinaface.cc.i"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_detect && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_detect/retinaface.cc > CMakeFiles/face_detect.dir/retinaface.cc.i

face_detect/CMakeFiles/face_detect.dir/retinaface.cc.s: cmake_force
	@echo "Compiling CXX source to assembly CMakeFiles/face_detect.dir/retinaface.cc.s"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_detect && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_detect/retinaface.cc -o CMakeFiles/face_detect.dir/retinaface.cc.s

face_detect/CMakeFiles/face_detect.dir/__/common/k510_drm.c.o: face_detect/CMakeFiles/face_detect.dir/flags.make
face_detect/CMakeFiles/face_detect.dir/__/common/k510_drm.c.o: common/k510_drm.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --progress-dir=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object face_detect/CMakeFiles/face_detect.dir/__/common/k510_drm.c.o"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_detect && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-gcc --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/face_detect.dir/__/common/k510_drm.c.o   -c /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/common/k510_drm.c

face_detect/CMakeFiles/face_detect.dir/__/common/k510_drm.c.i: cmake_force
	@echo "Preprocessing C source to CMakeFiles/face_detect.dir/__/common/k510_drm.c.i"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_detect && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-gcc --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/common/k510_drm.c > CMakeFiles/face_detect.dir/__/common/k510_drm.c.i

face_detect/CMakeFiles/face_detect.dir/__/common/k510_drm.c.s: cmake_force
	@echo "Compiling C source to assembly CMakeFiles/face_detect.dir/__/common/k510_drm.c.s"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_detect && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-gcc --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/common/k510_drm.c -o CMakeFiles/face_detect.dir/__/common/k510_drm.c.s

face_detect/CMakeFiles/face_detect.dir/__/common/v4l2.c.o: face_detect/CMakeFiles/face_detect.dir/flags.make
face_detect/CMakeFiles/face_detect.dir/__/common/v4l2.c.o: common/v4l2.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --progress-dir=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object face_detect/CMakeFiles/face_detect.dir/__/common/v4l2.c.o"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_detect && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-gcc --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/face_detect.dir/__/common/v4l2.c.o   -c /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/common/v4l2.c

face_detect/CMakeFiles/face_detect.dir/__/common/v4l2.c.i: cmake_force
	@echo "Preprocessing C source to CMakeFiles/face_detect.dir/__/common/v4l2.c.i"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_detect && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-gcc --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/common/v4l2.c > CMakeFiles/face_detect.dir/__/common/v4l2.c.i

face_detect/CMakeFiles/face_detect.dir/__/common/v4l2.c.s: cmake_force
	@echo "Compiling C source to assembly CMakeFiles/face_detect.dir/__/common/v4l2.c.s"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_detect && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-gcc --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/common/v4l2.c -o CMakeFiles/face_detect.dir/__/common/v4l2.c.s

face_detect/CMakeFiles/face_detect.dir/__/common/buf_mgt.cc.o: face_detect/CMakeFiles/face_detect.dir/flags.make
face_detect/CMakeFiles/face_detect.dir/__/common/buf_mgt.cc.o: common/buf_mgt.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --progress-dir=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object face_detect/CMakeFiles/face_detect.dir/__/common/buf_mgt.cc.o"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_detect && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/face_detect.dir/__/common/buf_mgt.cc.o -c /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/common/buf_mgt.cc

face_detect/CMakeFiles/face_detect.dir/__/common/buf_mgt.cc.i: cmake_force
	@echo "Preprocessing CXX source to CMakeFiles/face_detect.dir/__/common/buf_mgt.cc.i"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_detect && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/common/buf_mgt.cc > CMakeFiles/face_detect.dir/__/common/buf_mgt.cc.i

face_detect/CMakeFiles/face_detect.dir/__/common/buf_mgt.cc.s: cmake_force
	@echo "Compiling CXX source to assembly CMakeFiles/face_detect.dir/__/common/buf_mgt.cc.s"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_detect && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/common/buf_mgt.cc -o CMakeFiles/face_detect.dir/__/common/buf_mgt.cc.s

# Object files for target face_detect
face_detect_OBJECTS = \
"CMakeFiles/face_detect.dir/main.cc.o" \
"CMakeFiles/face_detect.dir/cv2_utils.cc.o" \
"CMakeFiles/face_detect.dir/anchors_320.cc.o" \
"CMakeFiles/face_detect.dir/anchors_640.cc.o" \
"CMakeFiles/face_detect.dir/retinaface.cc.o" \
"CMakeFiles/face_detect.dir/__/common/k510_drm.c.o" \
"CMakeFiles/face_detect.dir/__/common/v4l2.c.o" \
"CMakeFiles/face_detect.dir/__/common/buf_mgt.cc.o"

# External object files for target face_detect
face_detect_EXTERNAL_OBJECTS =

face_detect/face_detect: face_detect/CMakeFiles/face_detect.dir/main.cc.o
face_detect/face_detect: face_detect/CMakeFiles/face_detect.dir/cv2_utils.cc.o
face_detect/face_detect: face_detect/CMakeFiles/face_detect.dir/anchors_320.cc.o
face_detect/face_detect: face_detect/CMakeFiles/face_detect.dir/anchors_640.cc.o
face_detect/face_detect: face_detect/CMakeFiles/face_detect.dir/retinaface.cc.o
face_detect/face_detect: face_detect/CMakeFiles/face_detect.dir/__/common/k510_drm.c.o
face_detect/face_detect: face_detect/CMakeFiles/face_detect.dir/__/common/v4l2.c.o
face_detect/face_detect: face_detect/CMakeFiles/face_detect.dir/__/common/buf_mgt.cc.o
face_detect/face_detect: face_detect/CMakeFiles/face_detect.dir/build.make
face_detect/face_detect: face_detect/CMakeFiles/face_detect.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --progress-dir=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Linking CXX executable face_detect"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_detect && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/face_detect.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
face_detect/CMakeFiles/face_detect.dir/build: face_detect/face_detect

.PHONY : face_detect/CMakeFiles/face_detect.dir/build

face_detect/CMakeFiles/face_detect.dir/clean:
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_detect && $(CMAKE_COMMAND) -P CMakeFiles/face_detect.dir/cmake_clean.cmake
.PHONY : face_detect/CMakeFiles/face_detect.dir/clean

face_detect/CMakeFiles/face_detect.dir/depend:
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_detect /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_detect /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_detect/CMakeFiles/face_detect.dir/DependInfo.cmake
.PHONY : face_detect/CMakeFiles/face_detect.dir/depend

