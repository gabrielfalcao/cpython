#!/usr/bin/env bash

set -ex
./configure --prefix="${HOME}/usr" --with-pydebug --with-openssl="$(brew --prefix openssl)" --with-tcltk-libs="$(pkg-config --libs tcl tk)" --with-tcltk-includes="$(pkg-config --cflags tcl tk)"
make -j 8
make install
