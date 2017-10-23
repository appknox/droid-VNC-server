LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES = flinger.cpp

LOCAL_CFLAGS += -DPLATFORM_SDK_VERSION=$(PLATFORM_SDK_VERSION)

LOCAL_C_INCLUDES += $(LOCAL_PATH) $(LOCAL_PATH)/..

LOCAL_PRELINK_MODULE := false

LOCAL_MODULE := libdvnc_flinger_sdk$(PLATFORM_SDK_VERSION)
#LOCAL_MODULE_PATH := $(LOCAL_PATH)/../libs/$(TARGET_CPU_ABI)
LOCAL_MODULE_TAGS := optional

ifeq ($(PLATFORM_SDK_VERSION), 9)
LOCAL_SHARED_LIBRARIES := libsurfaceflinger_client libui libbinder libutils libcutils #libcrypto libssl libhardware
else ifeq ($(PLATFORM_SDK_VERSION), 10)
LOCAL_SHARED_LIBRARIES := libsurfaceflinger_client libui libbinder libutils libcutils
else ifeq ($(PLATFORM_SDK_VERSION), 14)
LOCAL_SHARED_LIBRARIES := libgui libui libbinder libcutils
else ifeq ($(PLATFORM_SDK_VERSION), 15)
LOCAL_SHARED_LIBRARIES := libgui libui libbinder libcutils
else
LOCAL_SHARED_LIBRARIES := libgui libui libbinder libcutils libutils
endif

include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)

LOCAL_SRC_FILES = flinger.cpp

LOCAL_CFLAGS += -DDVNC_STATIC_WRAPPER

LOCAL_C_INCLUDES += $(LOCAL_PATH) $(LOCAL_PATH)/..

LOCAL_PRELINK_MODULE := false

LOCAL_MODULE := libdvnc_flinger
#LOCAL_MODULE_PATH := $(LOCAL_PATH)/../libs/$(TARGET_CPU_ABI)
LOCAL_MODULE_TAGS := optional

ifeq ($(PLATFORM_SDK_VERSION), 9)
LOCAL_SHARED_LIBRARIES := libsurfaceflinger_client libui libbinder libutils libcutils #libcrypto libssl libhardware
else ifeq ($(PLATFORM_SDK_VERSION), 10)
LOCAL_SHARED_LIBRARIES := libsurfaceflinger_client libui libbinder libutils libcutils
else ifeq ($(PLATFORM_SDK_VERSION), 14)
LOCAL_SHARED_LIBRARIES := libgui libui libbinder libcutils
else ifeq ($(PLATFORM_SDK_VERSION), 15)
LOCAL_SHARED_LIBRARIES := libgui libui libbinder libcutils
else
LOCAL_SHARED_LIBRARIES := libgui libui libbinder libcutils libutils
endif

include $(BUILD_STATIC_LIBRARY)
