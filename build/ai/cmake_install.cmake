# Install script for directory: /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/exe" TYPE PROGRAM FILES
    "/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/imx219_1080x1920_0.conf"
    "/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/imx219_0.conf"
    "/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/imx219_1.conf"
    "/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/video_192x320.conf"
    "/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/video_object_detect_320.conf"
    "/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/video_object_detect_432x368.conf"
    "/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/video_object_detect_512.conf"
    "/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/video_object_detect_640x480.conf"
    "/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/video_object_detect_320x320.conf"
    "/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/video_object_detect_480x640.conf"
    "/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/video_object_detect_640.conf"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_detect/cmake_install.cmake")
  include("/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_landmarks/cmake_install.cmake")
  include("/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/object_detect/cmake_install.cmake")
  include("/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_alignment/cmake_install.cmake")
  include("/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_expression/cmake_install.cmake")
  include("/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation/cmake_install.cmake")
  include("/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/face_recog/cmake_install.cmake")
  include("/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/simple_pose/cmake_install.cmake")
  include("/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/openpose/cmake_install.cmake")
  include("/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/person_detect/cmake_install.cmake")
  include("/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/hand_image_classify/cmake_install.cmake")
  include("/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/license_plate_recog/cmake_install.cmake")
  include("/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/self_learning/cmake_install.cmake")
  include("/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/object_detect_demo/cmake_install.cmake")
  include("/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/retinaface_mb_320/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
