/* Activate Android specific settings in the 'config_site_sample.h' */
#define PJ_CONFIG_ANDROID 1

#define USER_SAVE_NDK_LOG

//To enable video
#define PJMEDIA_HAS_VIDEO 1

//To enable libyuv
#define PJMEDIA_HAS_LIBYUV 1

// 需要添加opus音频编解码器支持时定义该项
// #define PJMEDIA_HAS_OPUS_CODEC 1

//To enable TCP transport
// #define PJ_HAS_TCP 1

#include <pj/config_site_sample.h>