# This assumes that you installed the NDK using Android Studio, otherwise use the make-standalone-toolchain.sh from wherever you downloaded the NDK
export ANDROID_NDK_ROOT=$(HOME)/Library/Android/sdk/ndk-bundle

# this is the folder where you installed the toolchain
# something like:
#
# 	$(ANDROID_NDK_ROOT)/build/tools/make-standalone-toolchain.sh --arch=arm --platform=android-21 --install-dir=/opt/local/android
#
export ANDROID_TOOLCHAIN=/opt/local/android
export ANDROID_API=21

export MACHINE=armv7
export RELEASE=2.6.37
export SYSTEM=android
export ARCH=arm
export CROSS_COMPILE=arm-linux-androideabi

######################################################################
### stop editing here -- everything below this line should be okay ###
######################################################################

export ANDROID_TOOLCHAIN_BIN=$(ANDROID_TOOLCHAIN)/bin
export ANDROID_SYSROOT=$(ANDROID_TOOLCHAIN)/sysroot
export SYSROOT=$(ANDROID_SYSROOT)
export PATH:=$(PATH):$(ANDROID_TOOLCHAIN_BIN)

export CFLAGS=-fPIE -D__ANDROID_API__=$(ANDROID_API)
export CXXFLAGS=-fPIE -D__ANDROID_API__=$(ANDROID_API) -std=c++11 -I$(ANDROID_TOOLCHAIN)/include/c++/4.9.x
export LDFLAGS=-fPIE -L$(SYSROOT)/usr/lib

all: zlib openssl nghttp2 curl sqlite alexa
.PHONY: all

zlib:
	make -C zlib
.PHONY: zlib

openssl:
	make -C openssl
.PHONY: openssl

nghttp2:
	make -C nghttp2
.PHONY: nghttp2

curl:
	make -C curl
.PHONY: curl

sqlite:
	make -C sqlite
.PHONY: sqlite

alexa:
	make -C alexa
.PHONY: alexa

clean:
	-make -C zlib clean
	-make -C openssl clean
	-make -C nghttp2 clean
	-make -C curl clean
	-make -C sqlite clean
	-make -C alexa clean
.PHONY: clean

# cd openssl && ./build.sh
# cd nghttp2 && ./build.sh
# cd curl && ./build.sh