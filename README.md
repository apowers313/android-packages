# About

This is a collection of Makefiles to cross-compile Android packages. It's useful for two reasons:

1. These are some common dependencies for other packages
2. These can serve as examples of how to port future files

These ports seem to get stale fast, so if this repo hasn't been updated in the last 6 months you're probably going to have to do some hacking to get things to build.

# Setup

tl;dr

1. Install NDK
2. Edit Makefile
3. `make all` or `make <packge-name>`

## Install NDK

If you haven't already, download the NDK [here](https://developer.android.com/ndk/downloads/index.html) or [using the Android Studio SDK Manager](https://developer.android.com/ndk/guides/index.html). Start by setting up a [standalone toolchain](https://developer.android.com/ndk/guides/standalone_toolchain.html):

``` sh
$(NDKROOT)/build/tools/make-standalone-toolchain.sh --arch=arm --platform=android-21 --install-dir=/opt/local/android
```

Note that there are few options embedded above: the architecture you want to use, which Android API to support, and where to install the resulting files. See the [standalone toolchain instructions](https://developer.android.com/ndk/guides/standalone_toolchain.html) for more details on all that.

Make sure that the directory you installed in is writable -- we will be updating the `sysroot` directory when we install new packages so that they are automatically picked up by subsequent packages.

As a clever trick, you can run `git init` in your toolkit directory, followed by `git add *` and `git commit -am "initial commit"`. Then `git` will keep track of changes for you. Rolling back to your initial files is as simple as `git clean -df` and `git checkout -- *`. Or create new branches to revision your packages as you add new ones.

## Configure Makefile

The `Makefile` in the top directory has all the configuration variables for building. These are tyipcally picked up by the configuration and build scripts by the packages. Note that calling `export` in a `Makefile` makes the variables available to subsequent invocations of `make` -- always call make from the top-most directory or you won't have the right variables and things will definitely break.

Hopefully all the variables in the `Makefile` are self-explanatory. If not, drop an issue and I'll help you sort it out.

## Build

Type `make all` to install all packages; or type `make <package-name>` to install just that package. Note that make also installs the files in the `sysroot` directory. See note above about using `git` to track changes in `sysroot` so that you can roll-back changes.