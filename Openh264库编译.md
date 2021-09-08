# openh264库编译Android SO库

- [openh264库编译Android SO库](#openh264库编译android-so库)
  - [下载源码](#下载源码)
  - [编译脚本](#编译脚本)
  - [编译SO库](#编译so库)

***警告：编译改库必须使用android-ndk-r15c***

## 下载源码
``` shell
git clone git@github.com:cisco/openh264.git
```
## 编译脚本

``` shell
#!/bin/bash

# 需要指定 ANDROID_SDK 和 ANDROID_NDK
# 如果已经配置环境变量则不需要
export ANDROID_SDK=/mnt/e/library/linux/android/Sdk
export ANDROID_NDK=/mnt/e/library/linux/android-ndk-r15c
export PATH=$ANDROID_SDK/tools:$PATH

function build_openh264 {
  ABI=$1
  API_LEVEL=$2

  case $ABI in
    armeabi-v7a )
      ARCH=arm
      ;;
    arm64-v8a )
      ARCH=arm64
      ;;
    x86 )
      ARCH=x86
      ;;
    x86_64 )
      ARCH=x86_64
      ;;
  esac

  # 设置编译输出为Android库
  TARGET_OS=android
  # 设置android版本
  ANDROID_TARGET=android-$API_LEVEL
  # 设置输出文件路径
  BUILD_PREFIX=$(pwd)/libs/openh264-out/$ABI
  mkdir -p $BUILD_PREFIX

  echo "build libopenh264 ${ABI} ${ANDROID_TARGET}"
  echo "build libopenh264 ${ABI} output : ${BUILD_PREFIX}"

  # 执行清除操作
  make \
      OS=${TARGET_OS} \
      NDKROOT=$ANDROID_NDK \
      TARGET=$ANDROID_TARGET \
      ARCH=$ARCH \
      clean
  # 执行编译任务
  make \
      OS=${TARGET_OS} \
      NDKROOT=$ANDROID_NDK \
      TARGET=$ANDROID_TARGET \
      NDKLEVEL=$API_LEVEL \
      ARCH=$ARCH \
      PREFIX=$BUILD_PREFIX \
      -j4 install
}


# 在工程根路径下创建libs文件夹，编译后生成文件在此处
ROOT_PATH=$(pwd)
OPENH264_SOURCE_DIR=$ROOT_PATH/
mkdir $ROOT_PATH/libs

if [[ ! -d $OPENH264_SOURCE_DIR ]]; then
  echo "Did not found $OPENH264_SOURCE_DIR"
  exit 1
fi

cd $OPENH264_SOURCE_DIR

build_openh264 armeabi-v7a 16
build_openh264 arm64-v8a 21

```

## 编译SO库
``` shell
chmod u+x build_android_so.sh
./build_android_so.sh
```