# Adb
ifeq ($(TARGET_BUILD_VARIANT),eng)
# /vendor/default.prop is force-setting ro.adb.secure=1
# Get rid of that by overriding it in /product on eng builds
PRODUCT_PRODUCT_PROPERTIES += \
    ro.secure=0 \
    ro.adb.secure=0
endif
PRODUCT_PRODUCT_PROPERTIES += \
    ro.secure=0 \
    ro.adb.secure=0 \
    ro.force.debuggable=1 \
# Bluetooth
# ro.bluetooth.a2dp_offload.supported=false
# ro.vendor.mtk.bt_bleaudio_enable=false 
# vendor.audio.feature.a2dp_offload.enable=false
# PRODUCT_PRODUCT_PROPERTIES +=