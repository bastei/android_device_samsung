# Copyright (C) 2015 The CyanogenMod Project
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

# Also get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/samsung/serranove3gxx/serranove3gxx-vendor.mk)

# Inherit from fortuna-common
$(call inherit-product, device/samsung/serranovexx-common/serranovexx-common.mk)

# Common overlay
DEVICE_PACKAGE_OVERLAYS += device/samsung/serranove3gxx/overlay

PRODUCT_PROPERTY_OVERRIDES += \
	persist.radio.multisim.config=dsds \
	ro.multisim.simslotcount=2 \
	ro.ril.multi_rat_capable=true \
	ro.product.model=I9192I

