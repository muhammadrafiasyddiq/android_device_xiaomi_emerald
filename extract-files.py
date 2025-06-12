#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.fixups_blob import (
    blob_fixup,
    blob_fixups_user_type,
)
from extract_utils.fixups_lib import (
    lib_fixups,
    lib_fixups_user_type,
)
from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

namespace_imports = [
     'device/xiaomi/emerald',
     'hardware/mediatek',
     'hardware/xiaomi',
     'hardware/mediatek/libmtkperf_client',
     'vendor/xiaomi/emerald'
 ]

def lib_fixup_vendor_suffix(lib: str, partition: str, *args, **kwargs):
    return f'{lib}-{partition}' if partition == 'vendor' else None

lib_fixups: lib_fixups_user_type = {
    **lib_fixups,
    ('vendor.mediatek.hardware.videotelephony-V1-ndk',
     'vendor.xiaomi.hardware.fx.tunnel@1.0'): lib_fixup_vendor_suffix,
}

blob_fixups: blob_fixups_user_type = {

   'system_ext/lib64/libimsma.so': blob_fixup()
        .replace_needed('libsink.so', 'libsink-mtk.so'),


  'vendor/bin/hw/vendor.mediatek.hardware.mtkpower@1.0-service': blob_fixup()
        .replace_needed('android.hardware.power-V2-ndk_platform.so', 'android.hardware.power-V2-ndk.so'),
        
        
    'vendor/bin/hw/android.hardware.vibrator-service.mediatek': blob_fixup()
	.replace_needed('android.hardware.vibrator-V2-ndk_platform.so', 'android.hardware.vibrator-V2-ndk.so'),
	
	
    'vendor/bin/hw/android.hardware.lights-service.mediatek': blob_fixup()
	.replace_needed('android.hardware.light-V1-ndk_platform.so', 'android.hardware.light-V1-ndk_platform.so'),
	
	
    'vendor/lib64/libvendor.goodix.hardware.biometrics.fingerprint@2.1.so': blob_fixup()
	.replace_needed('libhidlbase.so', 'libhidlbase_shim.so'),
	
	
    ('vendor/lib64/vendor.mediatek.hardware.pq@2.14.so', 'vendor/lib64/vendor.mediatek.hardware.pq@2.15.so', 'vendor/lib64/hw/mt6789/vendor.mediatek.hardware.pq@2.15-impl.so'): blob_fixup()
        .replace_needed('libutils.so', 'libutils-v32.so'),
 
               
    ('vendor/lib64/mt6789/libmtkcam_stdutils.so', 'vendor/lib64/hw/mt6789/android.hardware.camera.provider@2.6-impl-mediatek.so'): blob_fixup()
        .replace_needed('libutils.so', 'libutils-v32.so')
	    .add_needed('libprocessgroup_shim.so'),
	
	
    ('vendor/lib64/ese_spi_nxp.so', 'vendor/lib64/libnvram.so', 'vendor/lib64/libsysenv.so'): blob_fixup()
        .add_needed('libbase_shim.so'),
        
        
    ('vendor/lib64/hw/hwcomposer.mtk_common.so', 'vendor/bin/hw/vendor.mediatek.hardware.pq@2.2-service') : blob_fixup()
        .add_needed('libprocessgroup_shim.so'),
        
    'vendor/bin/hw/android.hardware.security.keymint@1.0-service.mitee': blob_fixup()
        .replace_needed('android.hardware.security.keymint-V1-ndk_platform.so', 'android.hardware.security.keymint-V4-ndk.so'),

}  # fmt: skip

module = ExtractUtilsModule(
    'emerald',
    'xiaomi',
    blob_fixups=blob_fixups,
    namespace_imports=namespace_imports,
    lib_fixups=lib_fixups
)

if __name__ == '__main__':
    utils = ExtractUtils.device(module)
    utils.run()
