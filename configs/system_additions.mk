# Copyright (C) 2016 The Pure Experience Project
# Copyright (C) 2016 Yank555.lu's AOSP Project
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

# init.d and arise sound mod script support
PRODUCT_COPY_FILES += \
    vendor/yaosp/prebuilt/bin/sysinit:system/bin/sysinit \
    vendor/yaosp/prebuilt/bin/ariseinit:system/bin/ariseinit

# Pure-specific init file
PRODUCT_COPY_FILES += \
    vendor/yaosp/prebuilt/etc/init.yaosp.rc:root/init.yaosp.rc

# prebuilt su binary script support
PRODUCT_COPY_FILES += \
    vendor/yaosp/prebuilt/xbin/su:system/xbin/su

# Security Enhanced Linux
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Add bash shell
PRODUCT_COPY_FILES += \
    vendor/yaosp/prebuilt/bin/b:system/bin/b \
    vendor/yaosp/prebuilt/bin/bash:system/bin/bash \
    vendor/yaosp/prebuilt/etc/bash/bashrc:system/etc/bash/bashrc

## Don't compile SystemUITests
EXCLUDE_SYSTEMUI_TESTS := true
