# Inherit from those variable-heavy base files
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

PRODUCT_NAME := lineage_cph1909
PRODUCT_DEVICE := cph1909
PRODUCT_BRAND := OPPO
PRODUCT_MODEL := CPH1909
PRODUCT_MANUFACTURER := oppo
PRODUCT_SHIPPING_API_LEVEL := 28

# Add any other required properties or copy files here
# BUT DO NOT COPY manifest.xml or compatibility_matrix.xml here!
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/Image.gz-dtb:kernel

# Disable system server jar check
DISABLE_SYSTEMSERVER_JAR_CHECK := true
# This bypasses the error you just saw
PRODUCT_DEX_PREOPT_GENERATE_DM_FILES := false
WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY := true