#!/usr/bin/env bash
# GDBM, ZLIB, XZ and TCL/TK
export PATH="$(brew --prefix tcl-tk)/bin:$PATH"
export CFLAGS="-I$(brew --prefix gdbm)/include -I$(brew --prefix xz)/include -I$(brew --prefix tcl-tk)/include  -I$(brew --prefix zlib)/include ${CFLAGS}"
export CPPFLAGS="-I$(brew --prefix gdbm)/include -I$(brew --prefix xz)/include -I$(brew --prefix tcl-tk)/include  -I$(brew --prefix zlib)/include ${CPPFLAGS}"
export LDFLAGS="-L$(brew --prefix gdbm)/lib -I$(brew --prefix xz)/lib -I$(brew --prefix tcl-tk)/lib  -I$(brew --prefix zlib)/lib ${LDFLAGS} "
export PKG_CONFIG_PATH="$(brew --prefix tcl-tk)/lib/pkgconfig:$(brew --prefix zlib)/lib/pkgconfig"

set -ex
./configure --prefix="${HOME}/usr" --with-pydebug --with-openssl="$(brew --prefix openssl)" --with-tcltk-libs="$(pkg-config --libs tcl tk)" --with-tcltk-includes="$(pkg-config --cflags tcl tk)"
make -j 8
make install
