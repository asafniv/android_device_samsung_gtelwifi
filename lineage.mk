# Release name
PRODUCT_RELEASE_NAME := gtelwifi

# Inherit some common CM stuff.
$(call inherit-product, vendor/lineage/config/common_full_tablet_wifionly.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/gtelwifi/device_gtelwifi.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := gtelwifi
PRODUCT_NAME := lineage_gtelwifi
PRODUCT_BRAND := samsung
PRODUCT_MODEL := gtelwifi
PRODUCT_MANUFACTURER := samsung

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=gtelwifi \
    PRODUCT_NAME=gtelwifixx \
    BUILD_FINGERPRINT=samsung/gtelwifixx/gtelwifi:4.4.4/KTU84P/T560XXU0APL1:user/release-keys \
    PRIVATE_BUILD_DESC="gtelwifixx-user 4.4.4 KTU84P T560XXU0APL1 release-keys"
