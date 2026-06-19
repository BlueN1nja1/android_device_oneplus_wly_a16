#
# Copyright (C) 2021-2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from wly device
$(call inherit-product, device/oneplus/wly/device.mk)

# Inherit some common Infinity X stuff.
$(call inherit-product, vendor/infinity/config/common_full_phone.mk)

# Infinity-X Specific Flags
TARGET_DISABLE_EPPE := true
INFINITY_MAINTAINER := "BlueN1nja1"
TARGET_BOOT_ANIMATION_RES := 1080
TARGET_SUPPORTS_BLUR := true
TARGET_TOUCH_BOOST_SUPPORTED := true
TARGET_HAS_UDFPS := true
WITH_GAPPS := true
PRODUCT_NO_CAMERA := false

# ADB root
ALLOW_ADBD_ROOT := true
ALLOW_LOCAL_PROP_OVERRIDE := true

PRODUCT_NAME := infinity_wly
PRODUCT_DEVICE := wly
PRODUCT_MANUFACTURER := OnePlus
PRODUCT_BRAND := OnePlus
PRODUCT_MODEL := NE2211

PRODUCT_SYSTEM_NAME := OP516FL1
PRODUCT_SYSTEM_DEVICE := OP516FL1

PRODUCT_GMS_CLIENTID_BASE := android-oneplus

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="NE2213-user 16 BP2A.250605.015 S.26fc334-45cb8b-42d8f3 release-keys" \
    BuildFingerprint=OnePlus/NE2213/OP516FL1:16/BP2A.250605.015/S.26fc334-45cb8b-42d8f3:user/release-keys \
    DeviceName=OP516FL1 \
    DeviceProduct=NE2213 \
    SystemDevice=OP516FL1 \
    SystemName=NE2213

