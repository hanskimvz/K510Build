# Install script for directory: /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_recog

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/app/ai")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "0")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "TRUE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/exe/face_recog" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/exe/face_recog")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/exe/face_recog"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/exe" TYPE EXECUTABLE FILES "/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_recog/face_recog")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/exe/face_recog" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/exe/face_recog")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/exe/face_recog"
         OLD_RPATH "/riscv64/lib:/riscv64/opencv_4.5.1/lib:/riscv64/video_zt:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/exe/face_recog")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/shell" TYPE PROGRAM FILES "/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_recog/../shell/face_recog.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/exe" TYPE PROGRAM FILES
    "/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_recog/../imx219_0.conf"
    "/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_recog/../imx219_1.conf"
    "/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_recog/../video_object_detect_320.conf"
    "/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_recog/../video_object_detect_640.conf"
    )
endif()

