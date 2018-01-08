SOURCE_URL=https://github.com/curl/curl/releases/download/curl-7_57_0/curl-7.57.0.tar.gz
SOURCE_TARBALL=curl-7.57.0.tar.gz
SOURCE_DIR=curl-7.57.0

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
	cd $< && \
		./configure --host=arm-linux-androideabi --with-ssl --with-zlib --disable-ftp --disable-gopher --disable-file --disable-imap --disable-ldap --disable-ldaps --disable-pop3 --disable-proxy --disable-rtsp --disable-smtp --disable-telnet --disable-tftp --without-gnutls --without-libidn --without-librtmp --disable-dict --with-nghttp2=$(SYSROOT)/usr --without-smb --prefix=$(SYSROOT)/usr --with-sysroot=$(SYSROOT) && \
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




