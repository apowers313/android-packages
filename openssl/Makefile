SOURCE_URL=https://www.openssl.org/source/openssl-1.0.2n.tar.gz
SOURCE_TARBALL=openssl-1.0.2n.tar.gz
SOURCE_DIR=openssl-1.0.2n

# #stupid
export CROSS_COMPILE:=$(CROSS_COMPILE)-

all: $(SOURCE_DIR)
	cd openssl-1.0.2n && \
		perl -pi -e 's/install: all install_docs install_sw/install: install_docs install_sw/g' Makefile.org && \
		LANG=C sed -i .bak "s/-mandroid/-mandroid -fPIE -pie -D__ANDROID_API__=$(ANDROID_API)/g" Configure && \
		./config no-ssl2 no-ssl3 no-comp no-hw no-engine shared --install_prefix=/opt/local/android/sysroot --openssldir=/usr && \
		make depend && \
		make all && \
		make install
.PHONY: all

$(SOURCE_TARBALL):
	wget $(SOURCE_URL)

$(SOURCE_DIR): $(SOURCE_TARBALL)
	tar xzvf $(SOURCE_TARBALL)

clean:
	rm -rf $(SOURCE_TARBALL) $(SOURCE_DIR)
.PHONY: clean