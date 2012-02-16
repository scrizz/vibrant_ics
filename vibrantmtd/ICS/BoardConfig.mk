# Copyright (C) 2007 The Android Open Source Project
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

# BoardConfig.mk
#
# Product-specific compile-time definitions.
#
BOARD_SECOND_CAMERA_DEVICE := /dev/video2

BOARD_HAVE_FM_RADIO := true
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO
BOARD_FM_DEVICE := si4709


ifeq ($(HOST_OS),linux)
WITH_DEXPREOPT := true
endif

# Use the non-open-source parts, if they're present
-include vendor/samsung/aries/BoardConfigVendor.mk

# Use the parts that are common between all ariess
include device/samsung/aries/BoardConfigCommon.mk


# Recovery
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CUSTOM_RECOVERY_KEYMAPPING := device/samsung/aries/recovery/recovery_keys.c
BOARD_CUSTOM_GRAPHICS := device/samsung/aries/recovery/graphics.c
BOARD_USES_BML_OVER_MTD := true
BOARD_CUSTOM_BOOTIMG_MK := device/samsung/aries/shbootimg.mk
TARGET_RECOVERY_PRE_COMMAND := "echo 1 > /cache/.startrecovery; sync;"
BOARD_HAS_NO_SELECT_BUTTON := true
