SOURCE_URL=https://sqlite.org/2017/sqlite-autoconf-3210000.tar.gz
SOURCE_TARBALL=sqlite-autoconf-3210000.tar.gz
SOURCE_DIR=sqlite-autoconf-3210000

all: $(SOURCE_DIR)
	cd $< && \
		./configure \
			--host=arm-linux-androideabi \
			--prefix=$(SYSROOT)/usr \
			--with-sysroot=$(SYSROOT) && \
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
