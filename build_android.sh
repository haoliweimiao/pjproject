#!/bin/bash
pjsip_path=$(pwd)
TARGET_ABI=arm64-v8a

# 在pjsip同级路径下下载openh264源码，并参考 Openh264库编译文档进行编译，此处需要使用 openh264 库
openh264_lib_path=${pjsip_path}/../openh264/libs/openh264-out/${TARGET_ABI}/
cp -r ${openh264_lib_path}/lib/libopenh264.so ${pjsip_path}/pjsip-apps/src/swig/java/android/pjsua2/src/main/jniLibs/arm64-v8a

NDK_TOOLCHAIN_VERSION=4.9 \
APP_PLATFORM=android-22 \
source ${pjsip_path}/configure-android --use-ndk-cflags \
--with-openh264=${openh264_lib_path}