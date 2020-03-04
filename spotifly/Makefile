export ARCHS = armv7 armv7s arm64 arm64e
export TARGET = iphone:clang:latest:8.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = SpotiFly

SpotiFly_FILES = spotiflyRootListController.m
SpotiFly_INSTALL_PATH = /Library/PreferenceBundles
SpotiFly_FRAMEWORKS = UIKit
SpotiFly_PRIVATE_FRAMEWORKS = Preferences
SpotiFly_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/SpotiFly.plist$(ECHO_END)
