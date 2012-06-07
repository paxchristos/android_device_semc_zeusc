#Built by Pax, Based off full_maguro.mk

#Get Verizon APNs
PRODUCT_COPY_FILES := device/sample/etc/apns-conf_verizon.xml:system/etc/apns-conf.xml

#Make the proprietray files
$(call inherit-product, $(SRC_TARGET_DIR)/vendor/semc/zeusc/zeusc-vendor.mk)

#Start the actual biuld process
$(call inherit-product, device/semc/zeusc/device_zeusc.mk)

# Set those variables here to overwrite the inherited values.
PRODUCT_NAME := full_zeusc
PRODUCT_DEVICE := zeus
PRODUCT_BRAND := Android
PRODUCT_MODEL := Full AOSP on Zeus
