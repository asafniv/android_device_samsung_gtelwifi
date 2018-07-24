#
# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

ro.build.characteristics=tablet

LOCAL_PATH := device/samsung/gtelwifi

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Screen density
PRODUCT_AAPT_CONFIG := normal large xlarge
PRODUCT_AAPT_PREF_CONFIG := xlarge

PRODUCT_CHARACTERISTICS := tablet

# Rootdir
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,${LOCAL_PATH}/rootdir/boot,root)

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,${LOCAL_PATH}/rootdir/recovery,recovery/root)

# Audio
PRODUCT_PACKAGES += \
    audio.primary.sc8830 \
    audio_policy.sc8830 \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    libtinyalsa \
    libaudio-resampler \
    tinymix

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_effects.conf:system/etc/audio_effects.conf \
    $(LOCAL_PATH)/configs/audio/audio_hw.xml:system/etc/audio_hw.xml \
    $(LOCAL_PATH)/configs/audio/audio_para:system/etc/audio_para \
    $(LOCAL_PATH)/configs/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/configs/audio/codec_pga.xml:system/etc/codec_pga.xml \
    $(LOCAL_PATH)/configs/audio/tiny_hw.xml:system/etc/tiny_hw.xml

# Bluetooth
PRODUCT_PACKAGES += \
    libbt-vendor

# Camera
#PRODUCT_PACKAGES += \
#    camera.sc8830

PRODUCT_PROPERTY_OVERRIDES += \
    camera.disable_zsl_mode=1

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# Codecs
PRODUCT_PACKAGES += \
    libcolorformat_switcher \
    libstagefrighthw \
    libstagefright_sprd_mpeg4dec \
    libstagefright_sprd_mpeg4enc \
    libstagefright_sprd_h264dec \
    libstagefright_sprd_h264enc \
    libstagefright_sprd_vpxdec

# Compat
PRODUCT_PACKAGES += \
    libstlport

# Filesystem management tools
PRODUCT_PACKAGES += \
    setup_fs

# Graphics
PRODUCT_PACKAGES += \
    gralloc.sc8830 \
    hwcomposer.sc8830 \
    sprd_gsp.sc8830 \
    libion_sprd \
    libmemoryheapion_sprd

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/configs/keylayout/headset-keyboard.kl:system/usr/keylayout/headset-keyboard.kl \
    $(LOCAL_PATH)/configs/keylayout/sci-keypad.kl:system/usr/keylayout/sci-keypad.kl

# Lights
PRODUCT_PACKAGES += \
    lights.sc8830

# Media config
MEDIA_XML_CONFIGS := \
    $(LOCAL_PATH)/configs/media/media_codecs.xml \
    $(LOCAL_PATH)/configs/media/media_profiles.xml

PRODUCT_COPY_FILES += \
    $(foreach f,$(MEDIA_XML_CONFIGS),$(f):system/etc/$(notdir $(f)))

# Misc packages
PRODUCT_PACKAGES += \
    librs_jni \
    com.android.future.usb.accessory

# Permissions
PERMISSION_XML_FILES := \
    frameworks/native/data/etc/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.software.sip.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml

PRODUCT_COPY_FILES += \
    $(foreach f,$(PERMISSION_XML_FILES),$(f):system/etc/permissions/$(notdir $(f)))

# WiFi
PRODUCT_PACKAGES += \
    dhcpcd.conf \
    wpa_supplicant \
    hostapd \
    macloader

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/nvram_mfg.txt:system/etc/wifi/nvram_mfg.txt \
    $(LOCAL_PATH)/configs/wifi/nvram_net.txt:system/etc/wifi/nvram_net.txt \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf

# OpenGL ES 3.0
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# ART device props
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sys.fw.dex2oat_thread_count=4 \
    dalvik.vm.dex2oat-flags=--no-watch-dog

# enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1

# Dalvik heap config
$(call inherit-product-if-exists, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)
# HWUI memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xhdpi-2048-hwui-memory.mk)

PRODUCT_NAME := full_gtelwifi
PRODUCT_DEVICE := gtelwifi
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_MODEL := SM-T560

$(call inherit-product-if-exists, vendor/samsung/gtelwifi/gtelwifi-vendor.mk)
