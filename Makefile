DEBUG = 1
FINALPACKAGE = 0

export ARCHS = arm64 arm64e
export TARGET = iphone:clang:latest:11.0 

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SpotiFly

SpotiFly_FILES = Tweak.xm
SpotiFly_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += spotifly
include $(THEOS_MAKE_PATH)/aggregate.mk
