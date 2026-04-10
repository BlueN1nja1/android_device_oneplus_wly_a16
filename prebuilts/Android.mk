LOCAL_PATH := $(call my-dir)

################################
# XZGallery
################################

include $(CLEAR_VARS)

LOCAL_MODULE := XZGallery
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)

LOCAL_SRC_FILES := XZGallery.apk

# Install location
LOCAL_PRODUCT_MODULE := true
LOCAL_PRIVILEGED_MODULE := false

# APK is already signed
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_DEX_PREOPT := false

# Override stock gallery apps
LOCAL_OVERRIDES_PACKAGES := \
    Gallery \
    Gallery3D \
    GalleryNew3D \
    Gallery2 \
    Glimpse \
    Glimpse_prebuilt

include $(BUILD_PREBUILT)

################################
# PixelDocumentsUIGoogleOverlay
################################
include $(CLEAR_VARS)

LOCAL_MODULE := PixelDocumentsUIGoogleOverlay
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)

LOCAL_SRC_FILES := PixelDocumentsUIGoogleOverlay/PixelDocumentsUIGoogleOverlay.apk

# Product overlay
LOCAL_PRODUCT_MODULE := true
LOCAL_MODULE_PATH := $(TARGET_OUT_PRODUCT)/overlay

LOCAL_CERTIFICATE := PRESIGNED
LOCAL_DEX_PREOPT := false

include $(BUILD_PREBUILT)

################################
# UserLockscreenOverlay
################################
include $(CLEAR_VARS)

LOCAL_MODULE := UserLockscreenOverlay
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)

LOCAL_SRC_FILES := UserLockscreenOverlay/UserLockscreenOverlay.apk

# Product overlay
LOCAL_PRODUCT_MODULE := true
LOCAL_MODULE_PATH := $(TARGET_OUT_PRODUCT)/overlay

LOCAL_CERTIFICATE := PRESIGNED
LOCAL_DEX_PREOPT := false

include $(BUILD_PREBUILT)
