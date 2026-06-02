ARCHS = arm64
TARGET := iphone:clang:latest:14.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SecurityKey
SecurityKey_FILES = Tweak.mm
SecurityKey_FRAMEWORKS = UIKit Foundation

include $(THEOS)/makefiles/tweak.mk
