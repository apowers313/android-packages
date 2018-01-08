SOURCE_URL=https://zlib.net/zlib-1.2.11.tar.gz
SOURCE_TARBALL=zlib-1.2.11.tar.gz
SOURCE_DIR=zlib-1.2.11

export CC=$(ANDROID_TOOLCHAIN_BIN)/${CROSS_COMPILE}-gcc
export CXX=$(ANDROID_TOOLCHAIN_BIN)/${CROSS_COMPILE}-g++
export LD=$(ANDROID_TOOLCHAIN_BIN)/${CROSS_COMPILE}-ld
export AR=$(ANDROID_TOOLCHAIN_BIN)/${CROSS_COMPILE}-ar
export AS=$(ANDROID_TOOLCHAIN_BIN)/${CROSS_COMPILE}-as
export RANLIB=$(ANDROID_TOOLCHAIN_BIN)/${CROSS_COMPILE}-ranlib
export TARGETMACH=arm-none-linux-gnueabi
# unexport CFLAGS
# unexport CXXFLAGS
# unexport LDFLAGS

all: $(SOURCE_DIR)
	cd zlib-1.2.11 && \
		sed -i .bak '238,249 s:^:#:' configure && \
		configure --prefix=$(SYSROOT)/usr && \
		make && \
		make install
.PHONY: all

$(SOURCE_TARBALL):
	wget $(SOURCE_URL)

$(SOURCE_DIR): $(SOURCE_TARBALL)
	tar xzvf $(SOURCE_TARBALL)

clean:
	rm -rf $(SOURCE_TARBALL) $(SOURCE_DIR)
.PHONY: clean
