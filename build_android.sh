# NDK_TOOLCHAIN_VERSION=4.9 TARGET_ABI=armeabi-v7a TARGET_NAME=name  APP_PLATFORM=android-22 ./configure-android --use-ndk-cflags --with-openh264=${pwd}/libs/armeabi-v7a/

openh264_path=$(pwd)/../openh264/libs/openh264-out/
# ANDROID_NDK_ROOT="/home/von/libs/android-ndk-14b"
echo opeb h264 include path : ${openh264_path}

NDK_TOOLCHAIN_VERSION=4.9 TARGET_ABI=arm64-v8a APP_PLATFORM=android-22 ./configure-android --use-ndk-cflags --with-openh264=${openh264_path}/${TARGET_ABI}/
