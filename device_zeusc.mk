$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

# proprietary side of the device
$(call inherit-product-if-exists, vendor/semc/zeusc/zeusc-vendor.mk)


# Discard inherited values and use our own instead.
PRODUCT_NAME := zeus
PRODUCT_DEVICE := zeus
PRODUCT_MODEL := zeus

-include device/semc/zeus-common/zeus.mk

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

# semc msm7x30 uses high-density artwork where available
PRODUCT_LOCALES += hdpi

-include device/semc/msm7x30-common/prebuilt/resources-hdpi.mk

PRODUCT_PROPERTY_OVERRIDES += \
	ro.opengles.version=131072 \
	rild.libpath=/system/lib/libril-qc-1.so \
	rild.libargs=-d/dev/smd0 \
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

