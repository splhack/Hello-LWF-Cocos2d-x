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
    supports/lzma/LzmaDec.c \
    binding/lua/lwf_lua.cpp \
    binding/lua/lwf_luabinding.cpp \
    supports/luna-gen/luna.cpp
COCOS_PATH=$(LOCAL_PATH)/../../cocos2d/cocos
LOCAL_CFLAGS := -DLWF_USE_LUA
LOCAL_C_INCLUDES := $(COCOS_PATH) \
					$(COCOS_PATH)/platform/android \
					$(COCOS_PATH)/../external/lua/lua \
					$(LOCAL_PATH)/core \
                    $(LOCAL_PATH)/cocos2dx \
                    $(LOCAL_PATH)/supports/lzma \
                    $(LOCAL_PATH)/supports/luna-gen
LOCAL_EXPORT_CFLAGS := -DLWF_USE_LUA
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/core \
                           $(LOCAL_PATH)/cocos2dx
LOCAL_WHOLE_STATIC_LIBRARIES := luajit_static

include $(BUILD_STATIC_LIBRARY)

$(call import-module,../../cocos2d/external/lua/luajit/prebuilt/android)
