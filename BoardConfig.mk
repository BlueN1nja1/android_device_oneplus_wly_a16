#
# Copyright (C) 2021-2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Include the common OEM chipset BoardConfig.
include device/oneplus/sm8450-common/BoardConfigCommon.mk

DEVICE_PATH := device/oneplus/wly

# Disable excess rubbish
#TARGET_FORCE_PREBUILT_DISPLAY_HAL := true
#TARGET_EXCLUDES_LIVEDISPLAY_SDM := true

# HIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += $(DEVICE_PATH)/framework_compatibility_matrix.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

TARGET_TAP_TO_WAKE_NODE := "/proc/touchpanel/double_tap_enable"

# Bootctrl
PRODUCT_SOONG_NAMESPACES += hardware/qcom-caf/bootctrl

# Recovery
TARGET_RECOVERY_DENSITY := xxhdpi
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 126

# Include the proprietary files BoardConfig.
include vendor/oneplus/wly/BoardConfigVendor.mk

# Rom Vsync
TARGET_USES_HWC2 := true
TARGET_USES_GRALLOC4 := true
VSYNC_EVENT_PHASE_OFFSET_NS := 2000000
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 6000000
PRESENT_TIME_OFFSET_FROM_VSYNC_NS := 0
