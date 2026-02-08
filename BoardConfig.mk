#
# Copyright (C) 2021 The Android Open Source Project
# Copyright (C) 2021 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/oppo/cph1909

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true
TARGET_SUPPORTS_64_BIT_APPS := false

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := mt6765
TARGET_NO_BOOTLOADER := true

# These two are for MTK Chipsets only
BOARD_USES_MTK_HARDWARE := true
BOARD_HAS_MTK_HARDWARE := true

#crypto
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
BOARD_USES_METADATA_PARTITION := true

# Additional binaries & libraries needed for recovery
TARGET_RECOVERY_DEVICE_MODULES += \
    ld-android

TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/ld-android.so

# Assert
TARGET_OTA_ASSERT_DEVICE := CPH1909

# File systems
BOARD_HAS_LARGE_FILESYSTEM := true
#BOARD_RECOVERYIMAGE_PARTITION_SIZE := 31864432 # This is the maximum known partition size, but it can be higher, so we just omit it
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_COPY_OUT_VENDOR := vendor

# Kernel - Build from source for LineageOS 20.0
TARGET_NO_KERNEL := false
# Disable prebuilt kernel - use source instead
# TARGET_PREBUILT_KERNEL := $(BOARD_ASSET_PATH)/Image.gz-dtb

BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x14f88000
BOARD_KERNEL_TAGS_OFFSET := 0x13f88000
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version 2

# VINTF Metadata (Crucial for Android 13)
DEVICE_MATRIX_FILE := vendor/oppo/cph1909/compatibility_matrix.xml
DEVICE_MANIFEST_FILE := vendor/oppo/cph1909/manifest.xml

# System
TARGET_COPY_OUT_VENDOR := vendor

# Platform
TARGET_BOARD_PLATFORM := mt6765

# Disable Dexpreopt to bypass the "Missing compilation artifacts" error
WITH_DEXPREOPT := false
DEX_PREOPT_DEFAULT := nostripping

# Tells Soong to keep going even if modules are missing
ALLOW_MISSING_DEPENDENCIES := true
BUILD_BROKEN_DUP_RULES := true

# Fix the obsolete error by removing BUILD_BROKEN_PHONY_TARGETS
# Add these instead to handle path/env logic:
BUILD_BROKEN_OUTSIDE_INCLUDE_DIRS := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_PREBUILT_ELF_FILES := true
BUILD_BROKEN_MISSING_REQUIRED_MODULES := true
BUILD_BROKEN_VERIFY_USES_LIBRARIES := true
BUILD_BROKEN_VINTF_PRODUCT_COPY_FILES := true
BUILD_BROKEN_COPY_WHOLE_LIBRARIES := true
BUILD_BROKEN_USES_NETWORK := true

# Framework compatibility matrix
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := device/oppo/cph1909/framework_matrix.xml
BOARD_VNDK_VERSION := current
# Or if it fails to boot, try setting it to the version of your GSI vendor
# BOARD_VNDK_VERSION := 29 (for Android 10)

TARGET_KERNEL_SOURCE := kernel/oppo/cph1909
TARGET_KERNEL_CONFIG := oppo6765_18511_defconfig
# Build kernel from source
KERNEL_TOOLCHAIN := $(BUILD_OUT_EXECUTABLES)/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin
KERNEL_TOOLCHAIN_PREFIX := aarch64-linux-android-
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
NEED_KERNEL_MODULE_SYSTEM := true