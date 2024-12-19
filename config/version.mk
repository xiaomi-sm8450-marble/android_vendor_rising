# (C) 2023-2024 RisingOS

# RisingOS versioning

PRODUCT_SOONG_NAMESPACES += \
    vendor/rising/version

RISING_FLAVOR := VanillaIceCream
RISING_VERSION := 6.0
RISING_CODENAME := Ascension
RISING_RELEASE_TYPE := STABLE
RISING_CODE := $(RISING_VERSION)

RISING_BUILD_DATE := $(shell date +%y%m%d-%H%M)

CURRENT_DEVICE := $(shell echo "$(TARGET_PRODUCT)" | cut -d'_' -f 2,3)
MAINTAINER_LIST := $(shell cat vendor/risingOTA/risingOS.maintainers)
DEVICE_LIST := $(shell cat vendor/risingOTA/risingOS.devices)

RISING_BUILDTYPE := COMMUNITY

ifeq ($(WITH_GMS), true)
	ifeq ($(TARGET_CORE_GMS), true)
    	RISING_PACKAGE_TYPE ?= CORE
	else 
    	RISING_PACKAGE_TYPE ?= GAPPS
	endif
else
    RISING_PACKAGE_TYPE ?= VANILLA
endif

# Build version
RISING_BUILD_VERSION := $(RISING_VERSION)-$(RISING_RELEASE_TYPE)-$(RISING_BUILD_DATE)-$(RISING_PACKAGE_TYPE)-$(RISING_BUILDTYPE)-$(CURRENT_DEVICE)

# Display version
RISING_DISPLAY_VERSION := $(RISING_VERSION)-$(RISING_RELEASE_TYPE)-$(RISING_PACKAGE_TYPE)-$(RISING_BUILDTYPE)-$(CURRENT_DEVICE)

# RisingOS properties
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.rising.code=$(RISING_CODENAME) \
    ro.rising.packagetype=$(RISING_PACKAGE_TYPE) \
    ro.rising.releasetype=$(RISING_BUILDTYPE) \
    ro.rising.version?=$(RISING_VERSION) \
    ro.rising.build.version=$(RISING_BUILD_VERSION) \
    ro.rising.display.version?=$(RISING_DISPLAY_VERSION) \
    ro.rising.platform_release_codename=$(RISING_FLAVOR) \
    ro.rising.device=$(CURRENT_DEVICE) \
    ro.rising.storage?=$(RISING_STORAGE) \
    ro.rising.ram?=$(RISING_RAM) \
    ro.rising.battery?=$(RISING_BATTERY) \
    ro.rising.display_resolution?=$(RISING_DISPLAY)
