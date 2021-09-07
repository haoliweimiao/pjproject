# NDK_TOOLCHAIN_VERSION=4.9 TARGET_ABI=armeabi-v7a TARGET_NAME=name  APP_PLATFORM=android-22 ./configure-android --use-ndk-cflags --with-openh264=${pwd}/libs/armeabi-v7a/

TARGET_ABI=arm64-v8a
NDK_TOOLCHAIN_VERSION=4.9 TARGET_ABI=arm64-v8a APP_PLATFORM=android-22 ./configure-android --use-ndk-cflags --with-openh264=${pwd}/libs/${TARGET_ABI}/