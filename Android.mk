#
# Copyright (C) 2023 LineageOS
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),emerald)
include $(call all-makefiles-under,$(LOCAL_PATH))

include $(CLEAR_VARS)

# Libraries / Binaries linked to <dir>/<platform>/<lib>.so
VENDOR_PLATFORM_LINKS := \
	$(TARGET_OUT_VENDOR)/bin/v3avpud.mt6789 \
	$(TARGET_OUT_VENDOR)/bin/hw/android.hardware.graphics.allocator@4.0-service-mediatek.mt6789 \
	$(TARGET_OUT_VENDOR)/bin/hw/camerahalserver \
	$(TARGET_OUT_VENDOR)/lib/arm.graphics-V1-ndk_platform.so \
	$(TARGET_OUT_VENDOR)/lib/egl/libGLES_mali.so \
    $(TARGET_OUT_VENDOR)/lib/hw/android.hardware.graphics.allocator@4.0-impl-mediatek.so \
    $(TARGET_OUT_VENDOR)/lib/hw/android.hardware.graphics.mapper@4.0-impl-mediatek.so \
	$(TARGET_OUT_VENDOR)/lib/hw/gralloc.common.so \
	$(TARGET_OUT_VENDOR)/lib/hw/vulkan.mali.so \
	$(TARGET_OUT_VENDOR)/lib/libaalservice.so \
	$(TARGET_OUT_VENDOR)/lib/libaiselector.so \
	$(TARGET_OUT_VENDOR)/lib/libdpframework.so \
	$(TARGET_OUT_VENDOR)/lib/libgpudataproducer.so \
	$(TARGET_OUT_VENDOR)/lib/libmtk_drvb.so \
	$(TARGET_OUT_VENDOR)/lib/libpq_cust_base.so \
	$(TARGET_OUT_VENDOR)/lib/libpq_prot.so \
	$(TARGET_OUT_VENDOR)/lib/libvcodec_utility.so \
	$(TARGET_OUT_VENDOR)/lib/libvcodec_utility_v3a.so \
	$(TARGET_OUT_VENDOR)/lib/libvcodecdrv.so \
	$(TARGET_OUT_VENDOR)/lib/libvcodecdrv_v3a.so \
	$(TARGET_OUT_VENDOR)/lib/libvpudv3a_vcodec.so \
	$(TARGET_OUT_VENDOR)/lib64/arm.graphics-V1-ndk_platform.so \
	$(TARGET_OUT_VENDOR)/lib64/egl/libGLES_mali.so \
	$(TARGET_OUT_VENDOR)/lib64/hw/android.hardware.graphics.allocator@4.0-impl-mediatek.so \
	$(TARGET_OUT_VENDOR)/lib64/hw/android.hardware.graphics.mapper@4.0-impl-mediatek.so \
	$(TARGET_OUT_VENDOR)/lib64/hw/gralloc.common.so \
	$(TARGET_OUT_VENDOR)/lib64/hw/vendor.mediatek.hardware.pq@2.15-impl.so \
	$(TARGET_OUT_VENDOR)/lib64/hw/vulkan.mali.so \
	$(TARGET_OUT_VENDOR)/lib64/libaaa_ltm.so \
	$(TARGET_OUT_VENDOR)/lib64/libaaa_ltmx.so \
	$(TARGET_OUT_VENDOR)/lib64/libaal_cust_func.so \
	$(TARGET_OUT_VENDOR)/lib64/libaalservice.so \
	$(TARGET_OUT_VENDOR)/lib64/libaiselector.so \
	$(TARGET_OUT_VENDOR)/lib64/libdip_drv.so \
	$(TARGET_OUT_VENDOR)/lib64/libdip_postproc.so \
	$(TARGET_OUT_VENDOR)/lib64/libdpframework.so \
	$(TARGET_OUT_VENDOR)/lib64/libDR.so \
	$(TARGET_OUT_VENDOR)/lib64/liblpcnr.so \
	$(TARGET_OUT_VENDOR)/lib64/libmnl.so \
	$(TARGET_OUT_VENDOR)/lib64/libmsnr.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtk_drvb.so \
	$(TARGET_OUT_VENDOR)/lib64/libneuralnetworks_sl_driver_mtk_prebuilt.so \
	$(TARGET_OUT_VENDOR)/lib64/libneuron_adapter_mgvi.so \
	$(TARGET_OUT_VENDOR)/lib64/libneuron_runtime.5.so \
	$(TARGET_OUT_VENDOR)/lib64/libnir_neon_driver.so \
	$(TARGET_OUT_VENDOR)/lib64/libpq_cust_base.so \
	$(TARGET_OUT_VENDOR)/lib64/libpq_prot.so \
	$(TARGET_OUT_VENDOR)/lib64/libpqparamparser.so 
	
# Gatekeeper symlinks
GATEKEEPER_SYMLINKS := \
	$(TARGET_OUT_VENDOR)/lib64/hw/gatekeeper.default.so

# Sensors links
SENSORS_SYMLINKS := \
	$(TARGET_OUT_VENDOR)/lib64/hw/sensors.$(TARGET_BOARD_PLATFORM).so

# Audio symlinks
AUDIO_SYMLINKS := \
	$(TARGET_OUT_VENDOR)/lib64/hw/audio.primary.$(TARGET_BOARD_PLATFORM).so \
	$(TARGET_OUT_VENDOR)/lib64/hw/audio.r_submix.$(TARGET_BOARD_PLATFORM).so 
	
# VPUD symlink
VPUD_SYMLINKS := \
    $(TARGET_OUT_VENDOR)/bin/v3avpud

$(VENDOR_PLATFORM_LINKS): $(LOCAL_INSTALLED_MODULE)
	$(hide) echo "Linking $(notdir $@)"
	@ln -sf $(TARGET_BOARD_PLATFORM)/$(notdir $@) $@

$(GATEKEEPER_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	$(hide) echo "Linking $@"
	@ln -sf libSoftGatekeeper.so $@

$(SENSORS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	$(hide) echo "Linking $@"
	@ln -sf sensors.mediatek.V2.0.so $@

$(AUDIO_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	$(hide) echo "Linking $@"
	@ln -sf $(subst $(TARGET_BOARD_PLATFORM),mediatek,$(notdir $@)) $@

$(VPUD_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	$(hide) echo "Linking $@"
	@ln -sf $(notdir $@).$(TARGET_BOARD_PLATFORM) $@

ALL_DEFAULT_INSTALLED_MODULES += $(VENDOR_PLATFORM_LINKS) $(GATEKEEPER_SYMLINKS) $(SENSORS_SYMLINKS) $(AUDIO_SYMLINKS) $(VPUD_SYMLINKS)

endif
