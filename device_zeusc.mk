$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony.mk)
$(call inherit-product, device/common/gps/gps_eu_supl.mk)


# Discard inherited values and use our own instead.
PRODUCT_NAME := zeus
PRODUCT_DEVICE := zeus
PRODUCT_MODEL := zeus

TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel
PRODUCT_COPY_FILES += \
    $(TARGET_PREBUILT_KERNEL):kernel
### Merged in MSM7x30-common.mk here
DEVICE_PACKAGE_OVERLAYS += device/semc/msm7x30-common/overlay

$(call inherit-product, frameworks/base/build/phone-hdpi-512-dalvik-heap.mk)

PRODUCT_MANUFACTURER := Sony

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml


PRODUCT_COPY_FILES += \
    device/semc/msm7x30-common/prebuilt/fillers:root/filler \
    device/semc/msm7x30-common/prebuilt/10hostapconf:system/etc/init.d/10hostapconf \
    device/semc/msm7x30-common/prebuilt/ueventd.semc.rc:root/ueventd.semc.rc \
    device/semc/msm7x30-common/prebuilt/gps.conf:system/etc/gps.conf \
    device/semc/msm7x30-common/prebuilt/fstab:root/fstab \
    device/semc/msm7x30-common/prebuilt/bootrec:root/sbin/bootrec


#recovery resources
PRODUCT_COPY_FILES += \
    bootable/recovery/res/images/icon_firmware_error.png:root/res/images/icon_firmware_error.png \
    bootable/recovery/res/images/icon_firmware_install.png:root/res/images/icon_firmware_install.png \
    bootable/recovery/res/images/icon_clockwork.png:root/res/images/icon_clockwork.png \
    bootable/recovery/res/images/icon_error.png:root/res/images/icon_error.png \
    bootable/recovery/res/images/icon_installing.png:root/res/images/icon_installing.png \
    bootable/recovery/res/images/icon_installing_overlay01.png:root/res/images/icon_installing_overlay01.png \
    bootable/recovery/res/images/icon_installing_overlay02.png:root/res/images/icon_installing_overlay02.png \
    bootable/recovery/res/images/icon_installing_overlay03.png:root/res/images/icon_installing_overlay03.png \
    bootable/recovery/res/images/icon_installing_overlay04.png:root/res/images/icon_installing_overlay04.png \
    bootable/recovery/res/images/icon_installing_overlay05.png:root/res/images/icon_installing_overlay05.png \
    bootable/recovery/res/images/icon_installing_overlay06.png:root/res/images/icon_installing_overlay06.png \
    bootable/recovery/res/images/icon_installing_overlay07.png:root/res/images/icon_installing_overlay07.png \
    bootable/recovery/res/images/indeterminate01.png:root/res/images/indeterminate01.png \
    bootable/recovery/res/images/indeterminate02.png:root/res/images/indeterminate02.png \
    bootable/recovery/res/images/indeterminate03.png:root/res/images/indeterminate03.png \
    bootable/recovery/res/images/indeterminate04.png:root/res/images/indeterminate04.png \
    bootable/recovery/res/images/indeterminate05.png:root/res/images/indeterminate05.png \
    bootable/recovery/res/images/indeterminate06.png:root/res/images/indeterminate06.png \
    bootable/recovery/res/images/progress_empty.png:root/res/images/progress_empty.png \
    bootable/recovery/res/images/progress_fill.png:root/res/images/progress_fill.png

PRODUCT_PACKAGES += \
    gralloc.msm7x30 \
    copybit.msm7x30 \
    hwcomposer.msm7x30 \
    audio.primary.msm7x30 \
    audio_policy.msm7x30 \
    gps.semc \
    lights.semc \
    camera.semc \
    sensors.semc \
    libgenlock \
    libQcomUI \
    libtilerenderer \
    libmemalloc \
    liboverlay \
    librs_jni \
    Superuser \
    su \
    com.android.future.usb.accessory \
    libcyanogen-dsp\
    DSPManager \
    CMSettings \
    Gallery

# QCOM OMX
PRODUCT_PACKAGES += \
    libstagefrighthw \
    libOmxCore \
    libOmxVdec \
    libOmxVenc \
    libmm-omxcore \
    libdivxdrmdecrypt

#Torch
PRODUCT_PACKAGES += \
    Torch

PRODUCT_PROPERTY_OVERRIDES += \
    ro.tethering.kb_disconnect=1

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise
##End of msm7x30.mk file

##merged zeus-common into this folder 
PRODUCT_PACKAGES += \
    hostapd

# Init files
PRODUCT_COPY_FILES += \
    device/semc/zeusc/prebuilt/init.semc.rc:root/init.semc.rc

PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=eth0
##
# These is the hardware-specific overlay, which points to the location
# of hardware-specific resource overrides, typically the frameworks and
# application settings that are stored in resourced.
DEVICE_PACKAGE_OVERLAYS += device/semc/zeusc/overlay

# These are the hardware-specific configuration files
PRODUCT_COPY_FILES += \
    device/semc/zeusc/prebuilt/media_profiles.xml:system/etc/media_profiles.xml

# Init files
PRODUCT_COPY_FILES += \
    device/semc/zeusc/prebuilt/init.semc.usb.rc:root/init.semc.usb.rc \
    device/semc/msm7x30-common/prebuilt/logo_H.rle:root/logo.rle \
    device/semc/zeusc/prebuilt/hw_config.sh:system/etc/hw_config.sh \
    device/semc/zeusc/recovery.fstab:root/recovery.fstab \
    device/semc/zeusc/prebuilt/bootrec-device:root/sbin/bootrec-device

#WIFI modules
PRODUCT_COPY_FILES += \
    device/semc/zeusc/modules/bcm4329.ko:root/modules/bcm4329.ko
##end of zeus-common.mk

# semc msm7x30 uses high-density artwork where available
PRODUCT_LOCALES += hdpi

-include device/semc/zeusc/prebuilt/resources-hdpi.mk

PRODUCT_PROPERTY_OVERRIDES += \
	ro.opengles.version=131072 \
	rild.libpath=/system/lib/libril-qc-1.so \
	rild.libargs=-d/dev/smd0 \
	persist.rild.nitz_plmn=  \
	persist.rild.nitz_long_ons_0=  \
	persist.rild.nitz_long_ons_1=  \
	persist.rild.nitz_long_ons_2=  \
	persist.rild.nitz_long_ons_3=  \
	persist.rild.nitz_short_ons_0=  \
	persist.rild.nitz_short_ons_1=  \
	persist.rild.nitz_short_ons_2=  \
	persist.rild.nitz_short_ons_3=  \
	ro.ril.hsxpa=1 \
	ro.ril.gprsclass=10 \
	ro.ril.def.agps.mode=2 \
	ro.ril.def.agps.feature=1 \
	ro.telephony.default_network=4 \
	ro.telephony.call_ring.multiple=false \
	ro.telephony.ril_class=SemcRIL \
	ro.ril.disable.power.collapse=0 \
	ro.ril.fast.dormancy.timeout=3 \
	ro.ril.enable.sbm.feature=1 \
	pm.sleep_mode=1 \
	wifi.supplicant_scan_interval=15 \
	ro.com.google.locationfeatures=1 \
	ro.product.locale.language=en \
	ro.product.locale.region=US \
	persist.ro.ril.sms_sync_sending=1 \
	ro.use_data_netmgrd=true \
	com.qc.hardware=true \
	com.qc.hdmi_out=false \
	hwui.render_dirty_regions=false \
	hwui.disable_vsync=true \
	ro.telephony.ril.v3=datacall \
	ro.cdma.homesystem=64,65,76,77,78,79,80,81,82,83 \
	ro.cdma.home.operator.numeric=310004 \
	ro.cdma.home.operator.alpha=Verizon \
	ro.cdma.data_retry_config=max_retries=infinite,0,0,60000,120000,480000,900000 \
	persist.telephony.support_ipv6=true \
	persist.telephony.support_ipv4=true \
	ro.ril.vzw.feature=1 \
	ro.ril.wp.feature=1 \
	persist.sys.usb.config=mass_storage, adb \
	ro.sf.lcd_density=240 \

