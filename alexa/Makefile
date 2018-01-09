GIT_URL=https://github.com/alexa/avs-device-sdk.git
SOURCE_DIR=avs-device-sdk
BUILD_DIR=alexa-build

export BUILD_SYS=$(CROSS_COMPILE)
export LDFLAGS+=-lc++_shared -lnghttp2 -lssl -lcrypto -lz

all: $(SOURCE_DIR) $(BUILD_DIR)
	cd $(BUILD_DIR) && \
		cmake \
			-DCMAKE_TOOLCHAIN_FILE=../../Toolchain-arm-linux-androideabi.cmake \
			-DCURL_LIBRARY=$(SYSROOT)/usr/lib/libcurl.a \
			-DCURL_INCLUDE_DIR=$(SYSROOT)/usr/include/curl \
			-DCMAKE_SYSROOT=$(SYSROOT) \
			-DCMAKE_INCLUDE_PATH=$(ANDROID_TOOLCHAIN)/include/c++/4.9.x/string \
			../$(SOURCE_DIR) && \
		make VERBOSE=1 && \
		make DESTDIR=$(SYSROOT) install
.PHONY: all

$(SOURCE_DIR):
	git clone $(GIT_URL)

$(BUILD_DIR):
	-mkdir $@

clean:
	-rm -rf $(BUILD_DIR) $(SOURCE_DIR)
.PHONY: clean

			# -DCMAKE_TOOLCHAIN_FILE=$(ANDROID_NDK_ROOT)/build/cmake/android.toolchain.cmake \
			# --debug-output \
			# -Wdev \
			# --trace \
