# Copyright (C) 2013 The CyanogenMod Project
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

# inherit from Sony common
include device/sony/common/BoardConfigCommon.mk

# inherit from msm8960-common
include device/sony/msm8960-common/BoardConfigCommon.mk

TARGET_SPECIFIC_HEADER_PATH := device/sony/blue-common/include

# Kernel properties
TARGET_KERNEL_SOURCE := kernel/sony/msm8x60

# Platform
TARGET_BOOTLOADER_BOARD_NAME := MSM8960
TARGET_BOARD_PLATFORM := msm8960
BOARD_VENDOR_PLATFORM := blue

# Architecture
TARGET_GLOBAL_CFLAGS += -mfpu=neon-vfpv4 -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon-vfpv4 -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS += -D__ARM_USE_PLD -D__ARM_CACHE_LINE_SIZE=64
TARGET_CPU_VARIANT := krait

# Krait optimizations
TARGET_USE_KRAIT_BIONIC_OPTIMIZATION := true
TARGET_USE_KRAIT_PLD_SET      := true
TARGET_KRAIT_BIONIC_PLDOFFS   := 10
TARGET_KRAIT_BIONIC_PLDTHRESH := 10
TARGET_KRAIT_BIONIC_BBTHRESH  := 64
TARGET_KRAIT_BIONIC_PLDSIZE   := 64

# Kernel information
BOARD_KERNEL_CMDLINE := # This is ignored by sony's bootloader
BOARD_KERNEL_BASE := 0x80200000
BOARD_RECOVERY_BASE := 0x80200000
BOARD_KERNEL_PAGESIZE := 2048
SONY_FORCE_RAMDISK_ADDRESS := 0x81900000
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01700000

# Time
BOARD_USES_QC_TIME_SERVICES := true

# Dumpstate
BOARD_LIB_DUMPSTATE := libdumpstate.sony

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true

# Wifi
BOARD_HAS_QCOM_WLAN              := true
BOARD_WLAN_DEVICE                := qcwcn
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME          := "wlan"
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"

BOARD_USE_SONY_MACUPDATE := true

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)
TARGET_NO_RPC := true

# Bluetooth
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true

# RIL
BOARD_HAS_RIL_LEGACY_PAP := true

# Needed for blobs
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS

# Vold
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# Custom boot
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_CUSTOM_BOOTIMG_MK := device/sony/blue-common/custombootimg.mk
TARGET_RELEASETOOLS_EXTENSIONS := device/sony/blue-common
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"

TARGET_RECOVERY_FSTAB := device/sony/blue-common/rootdir/fstab.qcom

# QCOM/CAF hardware
BOARD_USES_QCOM_HARDWARE := true

# Audio
BOARD_USES_ALSA_AUDIO := true
BOARD_USES_LEGACY_ALSA_AUDIO := true
TARGET_USES_QCOM_COMPRESSED_AUDIO := true
BOARD_HAVE_NEW_QCOM_CSDCLIENT := true
# ANC Headset is not yet implemented in CM12
QCOM_ANC_HEADSET_ENABLED := false

# Sensors
SOMC_CFG_SENSORS := true
SOMC_CFG_SENSORS_LIGHT_AS3676 := yes
SOMC_CFG_SENSORS_LIGHT_AS3676_MAXRANGE := 9000
SOMC_CFG_SENSORS_LIGHT_AS3676_PATH := "/sys/devices/i2c-10/10-0040"
SOMC_CFG_SENSORS_GYRO_MPU3050 := yes
SOMC_CFG_SENSORS_PROXIMITY_APDS9702 := yes
SOMC_CFG_SENSORS_ACCEL_BMA250NA_INPUT := yes
SOMC_CFG_SENSORS_COMPASS_AK8972 := yes

# Internal storage fuse daemon permissions
TARGET_FUSE_SDCARD_UID := 2800
TARGET_FUSE_SDCARD_GID := 2800

# Fix Adreno's INVAL
BOARD_USES_LEGACY_MMAP := true

# Memory allocator
MALLOC_IMPL := dlmalloc

# TWRP flags
DEVICE_RESOLUTION := 720x1280
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_HAS_NO_RECOVERY_PARTITION := true
TW_FLASH_FROM_STORAGE := true
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_INCLUDE_CRYPTO := true
TW_CRYPTO_FS_TYPE := "ext4"
TW_CRYPTO_REAL_BLKDEV := "/dev/block/platform/msm_sdcc.1/by-name/Userdata"
TW_CRYPTO_MNT_POINT := "/data"
TW_CRYPTO_FS_OPTIONS := "nosuid,nodev,barrier=1,noauto_da_alloc,discard"
TW_CRYPTO_FS_FLAGS := "0x00000406"
TW_CRYPTO_KEY_LOC := "footer"
TW_INCLUDE_FUSE_EXFAT := true
TW_MAX_BRIGHTNESS := 255
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight_1/brightness"
TW_SECONDARY_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight_2/brightness"

BOARD_SEPOLICY_DIRS += \
    device/sony/blue-common/sepolicy/common \
    device/sony/blue-common/sepolicy/test \

BOARD_SEPOLICY_UNION += \
       genfs_contexts \
       file_contexts \
       service_contexts \
       property_contexts \
       te_macros \
       device.te \
       vold.te \
       ueventd.te \
       file.te \
       property.te \
       untrusted_app.te \
       drmserver.te \
       adbd.te \
       app.te \
       cnd.te \
       system_server.te \
       wpa_supplicant.te \
       mediaserver.te \
       msm_irqbalanced.te \
       qmuxd.te \
       netmgrd.te \
       port-bridge.te \
       atfwd.te \
       radio.te \
       smd_test.te \
       qmi_ping.te \
       qmi_test_service.te \
       irsc_util.te \
       netd.te \
       rild.te \
       diag.te \
       diag_test.te \
       audiod.te \
       service.te \
       system_app.te \
       thermal-engine.te \
       vm_bms.te \
       global_macros.te \
       system_app.te \
       bluetooth.te \
       init_shell.te \
       mpdecision.te \
       perfd.te \
       mm-qcamerad.te \
       domain.te \
       init.te \
       time_daemon.te \
       rmt_storage.te \
       rfs_access.te \
       hvdcp.te \
       qseecomd.te \
       mcStarter.te \
       keystore.te \
       ims.te \
       healthd.te \
       charger_monitor.te \
       surfaceflinger.te \
       mm-pp-daemon.te \
       wpa.te \
       bootanim.te \
       zygote.te \
       mdm_helper.te \
       peripheral_manager.te \
       qcomsysd.te \
       servicemanager.te \
       usb_uicc_daemon.te \
       adsprpcd.te \
       qlogd.te \
       ipacm.te \
       dpmd.te \
       ssr_setup.te \
       subsystem_ramdump.te \
       ssr_diag.te \
       sectest.te \
       location.te \
       location_app.te \
       seapp_contexts \
       logd.te \
       installd.te \
       sensors.te \
       sensors_test.te


# inherit from the proprietary version
-include vendor/sony/blue-common/BoardConfigVendor.mk
