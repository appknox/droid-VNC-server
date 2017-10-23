LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_CFLAGS  +=  -Wall -Wno-unused-variable -Wno-maybe-uninitialized -Wno-unused-but-set-variable\
									-DDVNC_STATIC_WRAPPER

LOCAL_SHARED_LIBRARIES := liblog libz
LOCAL_SHARED_LIBRARIES += libgui libui libhardware libutils

LOCAL_SRC_FILES += \
									 droidvncserver.c \
									 gui.c \
									 inputMethods/input.c \
									 screenMethods/adb.c \
									 screenMethods/framebuffer.c \
									 screenMethods/gralloc.c \
									 screenMethods/flinger.c \
									 suinput/suinput.c

LOCAL_C_INCLUDES += \
										$(LOCAL_PATH) \
										$(LOCAL_PATH)/screenMethods \
										$(LOCAL_PATH)/inputMethods \
										$(LOCAL_PATH)/suinput \
										$(LOCAL_PATH)/linux \
										$(LOCAL_PATH)/../../nativeMethods \
										external/libvncserver

LOCAL_STATIC_LIBRARIES := libvncserver
LOCAL_STATIC_LIBRARIES += libdvnc_flinger
LOCAL_STATIC_LIBRARIES += libdvnc_gralloc
LOCAL_MODULE_TAGS := optional

LOCAL_MODULE := droidvncserver

include $(BUILD_EXECUTABLE)
