LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
        SPRDVPXDecoder.cpp

LOCAL_C_INCLUDES := \
    $(TOP)/frameworks/av/media/libstagefright/include \
    $(TOP)/frameworks/native/include/media/openmax \
    $(TOP)/frameworks/native/include/media/hardware \
    $(TOP)/frameworks/native/include/ui \
    $(TOP)/frameworks/native/include/utils \
    $(TOP)/frameworks/native/include/media/hardware \
    $(TOP)/device/samsung/gtelwifi/libmemoryheapion_sprd \
    $(TOP)/device/samsung/gtelwifi/gralloc \
    $(TOP)/device/samsung/gtelwifi/mali/src/ump/include \
    $(TOP)/device/samsung/gtelwifi/libstagefrighthw/include \
    $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include/video/

LOCAL_ADDITIONAL_DEPENDENCIES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr

LOCAL_CFLAGS := -DOSCL_EXPORT_REF= -DOSCL_IMPORT_REF=

LOCAL_ARM_MODE := arm

LOCAL_SHARED_LIBRARIES := \
        libstagefright libstagefright_omx libstagefright_foundation libstagefrighthw libutils libui libmemoryheapion_sprd libdl liblog

LOCAL_MODULE := libstagefright_sprd_vpxdec
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)

include $(call all-makefiles-under,$(LOCAL_PATH))

