#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2019-2021 The OrangeFox Recovery Project
#	
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
# 	
# 	Please maintain this if you use this script or any part of it
#

FOX_MANIFEST_ROOT=$(gettop)
if [ -f $FOX_MANIFEST_ROOT/bootable/recovery/orangefox_defaults.go -a -f $FOX_MANIFEST_ROOT/bootable/recovery/orangefox.mk ]; then
	# Unset obsolete/conflicting vars that may linger in the shell environment
	unset OF_AB_DEVICE
	unset OF_SUPPORT_ALL_BLOCK_OTA_UPDATES
	unset OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR
	unset OF_PATCH_AVB20
	unset OF_USE_NEW_MAGISKBOOT
	unset FOX_R11
	unset FOX_REPLACE_BUSYBOX_PS
	unset FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER
	unset FOX_USE_ZIP_BINARY

	export TW_DEFAULT_LANGUAGE="en"
	export LC_ALL="C"
	export ALLOW_MISSING_DEPENDENCIES=true

	# A/B & Virtual A/B
	export FOX_AB_DEVICE=1
	export FOX_VIRTUAL_AB_DEVICE=1
	export OF_AB_DEVICE_WITH_RECOVERY_PARTITION=0

	# Screen settings (Xiaomi 11T Pro: 1080x2400 20:9, center punch-hole)
	export OF_SCREEN_H=2400
	export OF_STATUS_H=100
	export OF_STATUS_INDENT_LEFT=48
	export OF_STATUS_INDENT_RIGHT=48
	export OF_HIDE_NOTCH=1
	export OF_CLOCK_POS=1
	export OF_ALLOW_DISABLE_NAVBAR=0

	# Encryption & Partition settings (A12-A17 FBEv2 + Metadata Encryption)
	export OF_DONT_PATCH_ENCRYPTED_DEVICE=1
	export OF_KEEP_FORCED_ENCRYPTION=1
	export OF_FBE_METADATA_MOUNT_IGNORE=1
	export OF_WIPE_METADATA_AFTER_DATAFORMAT=1
	export OF_FORCE_CASEFOLDING=1
	export OF_ENABLE_FS_COMPRESSION=1
	export OF_UNBIND_SDCARD_F2FS=1
	export OF_ENABLE_LPTOOLS=1
	export OF_ENABLE_ALL_PARTITION_TOOLS=1
	export OF_DYNAMIC_FULL_SIZE=9126805504
	export OF_NO_TREBLE_COMPATIBILITY_CHECK=1

	# Binaries & Tools
	export FOX_ENABLE_APP_MANAGER=1
	export FOX_USE_BASH_SHELL=1
	export FOX_ASH_IS_BASH=1
	export FOX_USE_NANO_EDITOR=1
	export FOX_USE_TAR_BINARY=1
	export FOX_USE_SED_BINARY=1
	export FOX_USE_XZ_UTILS=1
	export FOX_USE_LZ4_BINARY=1
	export FOX_USE_ZSTD_BINARY=1
	export FOX_USE_DATE_BINARY=1
	export FOX_USE_GREP_BINARY=1
	export FOX_USE_BUSYBOX_BINARY=1
	export FOX_USE_FSCK_EROFS_BINARY=1
	export FOX_USE_PATCHELF_BINARY=1
	export FOX_REPLACE_TOOLBOX_GETPROP=1
	export FOX_USE_UPDATED_MAGISKBOOT=1

	# KernelSU / Next / SukiSU support
	export FOX_ENABLE_KERNELSU_SUPPORT=1
	export FOX_ENABLE_KERNELSU_NEXT_SUPPORT=1
	export FOX_ENABLE_SUKISU_SUPPORT=1

	# Misc OrangeFox settings
	export OF_USE_GREEN_LED=0
	export FOX_DELETE_AROMAFM=1
	export OF_QUICK_BACKUP_LIST="/boot;/data;"

	# let's see what are our build VARs
	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
	   export | grep "FOX" >> $FOX_BUILD_LOG_FILE
	   export | grep "OF_" >> $FOX_BUILD_LOG_FILE
	   export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
	   export | grep "TW_" >> $FOX_BUILD_LOG_FILE
	fi
fi

