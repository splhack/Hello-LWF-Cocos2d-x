LOCAL_PATH := $(call my-dir)/../cplusplus
include $(CLEAR_VARS)
LOCAL_MODULE := lwf_static
LOCAL_MODULE_FILENAME := liblwf
LOCAL_SRC_FILES := \
    cocos2dx/lwf_cocos2dx_bitmap.cpp \
    cocos2dx/lwf_cocos2dx_factory.cpp \
    cocos2dx/lwf_cocos2dx_node.cpp \
    cocos2dx/lwf_cocos2dx_particle.cpp \
    cocos2dx/lwf_cocos2dx_resourcecache.cpp \
    cocos2dx/lwf_cocos2dx_textbmfont.cpp \
    cocos2dx/lwf_cocos2dx_textttf.cpp \
    core/lwf_animation.cpp \
    core/lwf_bitmap.cpp \
    core/lwf_bitmapclip.cpp \
    core/lwf_bitmapex.cpp \
    core/lwf_button.cpp \
    core/lwf_core.cpp \
    core/lwf_coredata.cpp \
    core/lwf_data.cpp \
    core/lwf_event.cpp \
    core/lwf_eventbutton.cpp \
    core/lwf_eventmovie.cpp \
    core/lwf_format.cpp \
    core/lwf_graphic.cpp \
    core/lwf_input.cpp \
    core/lwf_iobject.cpp \
    core/lwf_lwfcontainer.cpp \
    core/lwf_movie.cpp \
    core/lwf_movieat.cpp \
    core/lwf_movieop.cpp \
    core/lwf_movieprop.cpp \
    core/lwf_object.cpp \
    core/lwf_particle.cpp \
    core/lwf_programobj.cpp \
    core/lwf_property.cpp \
    core/lwf_text.cpp \
    core/lwf_utility.cpp \
    supports/lzma/Alloc.c \
    supports/lzma/LzmaDec.c
COCOS_PATH=$(LOCAL_PATH)/../../cocos2d/cocos
LOCAL_C_INCLUDES := $(COCOS_PATH) \
					$(COCOS_PATH)/platform/android \
					$(LOCAL_PATH)/core \
                    $(LOCAL_PATH)/cocos2dx \
                    $(LOCAL_PATH)/supports/lzma
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/core \
                           $(LOCAL_PATH)/cocos2dx
include $(BUILD_STATIC_LIBRARY)
