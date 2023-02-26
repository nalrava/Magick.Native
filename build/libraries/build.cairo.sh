#!/bin/bash
set -e

cd cairo

rm src/cairo-features.h
rm src/config.h

mkdir __build
cd __build
CXXFLAGS=$FLAGS meson .. $MESON_OPTIONS --buildtype=$MESON_BUILD_TYPE --prefix=/usr/local --default-library=static -Dxlib=disabled -Dquartz=disabled -Dtests=disabled

sed -i 's/#define CAIRO_HAS_PTHREAD 1/#define CAIRO_NO_MUTEX 1/' config.h

ninja install
