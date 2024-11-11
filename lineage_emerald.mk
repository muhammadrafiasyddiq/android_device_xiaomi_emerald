#
# Copyright (C) 2023 LineageOS
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from device makefile
$(call inherit-product, device/xiaomi/emerald/device.mk)

# Inherit some common stuff
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)
TARGET_BOOT_ANIMATION_RES := 1080

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := emerald
PRODUCT_NAME := lineage_emerald
PRODUCT_BRAND := POCO
PRODUCT_MODEL := 2312FPCA6G
PRODUCT_MANUFACTURER := Xiaomi

BUILD_FINGERPRINT :=POCO/emerald_p_id/emerald:14/UP1A.231005.007/V816.0.6.0.UNFIDXM:user/release-keys
PRIVATE_BUILD_DESC="emerald_p_id-user 14 UP1A.231005.007 V816.0.6.0.UNFIDXM release-keys"

PRODUCT_BUILD_PROP_OVERRIDES += \
       PRODUCT_NAME=emerald_p_id
       
PRODUCT_GMS_CLIENTID_BASE := android-xiaomi