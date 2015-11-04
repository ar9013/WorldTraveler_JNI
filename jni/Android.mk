LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := SecondSight
LOCAL_C_INCLUDES += $(LOCAL_PATH)/include
LOCAL_LDLIBS := -lstdc++
LOCAL_LDLIBS += -llog
LOCAL_LDLIBS += -lz
LOCAL_STATIC_LIBRARIES += opencv_calib3d
LOCAL_STATIC_LIBRARIES += opencv_features2d
LOCAL_STATIC_LIBRARIES += opencv_flann
LOCAL_STATIC_LIBRARIES += opencv_imgproc
LOCAL_STATIC_LIBRARIES += opencv_core
LOCAL_STATIC_LIBRARIES += opencv_hal
ifneq ($(TARGET_ARCH_ABI), arm64-v8a)
    ifneq ($(TARGET_ARCH_ABI), armeabi)
        LOCAL_STATIC_LIBRARIES += tbb
    endif
endif
LOCAL_SRC_FILES := SecondSightJNI.cpp
LOCAL_SRC_FILES += RecolorCMVFilter.cpp
LOCAL_SRC_FILES += RecolorRCFilter.cpp
LOCAL_SRC_FILES += RecolorRGVFilter.cpp
LOCAL_SRC_FILES += StrokeEdgesFilter.cpp
LOCAL_SRC_FILES += ImageDetectionFilter.cpp
include $(BUILD_SHARED_LIBRARY)


#############################
# Prebuilt static libraries #
#############################

include $(CLEAR_VARS)
LOCAL_MODULE := opencv_calib3d
LOCAL_SRC_FILES := libs/$(TARGET_ARCH_ABI)/libopencv_calib3d.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := opencv_features2d
LOCAL_SRC_FILES := libs/$(TARGET_ARCH_ABI)/libopencv_features2d.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := opencv_flann
LOCAL_SRC_FILES := libs/$(TARGET_ARCH_ABI)/libopencv_flann.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := opencv_imgproc
LOCAL_SRC_FILES := libs/$(TARGET_ARCH_ABI)/libopencv_imgproc.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := opencv_core
LOCAL_SRC_FILES := libs/$(TARGET_ARCH_ABI)/libopencv_core.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := opencv_hal
LOCAL_SRC_FILES := libs/$(TARGET_ARCH_ABI)/libopencv_hal.a
include $(PREBUILT_STATIC_LIBRARY)

ifneq ($(TARGET_ARCH_ABI), arm64-v8a)
    ifneq ($(TARGET_ARCH_ABI), armeabi)
        include $(CLEAR_VARS)
        LOCAL_MODULE := tbb
        LOCAL_SRC_FILES := libs/$(TARGET_ARCH_ABI)/libtbb.a
        include $(PREBUILT_STATIC_LIBRARY)
    endif
endif
