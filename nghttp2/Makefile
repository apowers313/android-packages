SOURCE_URL=https://github.com/nghttp2/nghttp2/releases/download/v1.29.0/nghttp2-1.29.0.tar.gz
SOURCE_TARBALL=nghttp2-1.29.0.tar.gz
SOURCE_DIR=nghttp2-1.29.0

all: $(SOURCE_DIR)
	cd $< && \
		configure \
		    --disable-shared \
		    --host=arm-linux-androideabi \
		    --build=`dpkg-architecture -qDEB_BUILD_GNU_TYPE` \
		    --without-libxml2 \
		    --disable-python-bindings \
		    --disable-examples \
		    --disable-threads \
		    --with-openssl \
		    --prefix=$(SYSROOT)/usr \
		    CC=$(ANDROID_TOOLCHAIN_BIN)/arm-linux-androideabi-clang \
		    CXX=$(ANDROID_TOOLCHAIN_BIN)/arm-linux-androideabi-clang++ \
		    CPPFLAGS="-fPIE -I$(SYSROOT)/usr/include" \
		    PKG_CONFIG_LIBDIR="$(SYSROOT)/usr/lib/pkgconfig" \
		    LDFLAGS="-fPIE -pie -L$(SYSROOT)/usr/lib" && \
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

# "android","gcc:-mandroid
# "android-armv7","gcc:-march=armv7-a