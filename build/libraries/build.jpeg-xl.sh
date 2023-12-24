#!/bin/bash
set -e

cd jpeg-xl

rm lib/include/jxl/jxl_export.h
rm lib/include/jxl/jxl_threads_export.h
rm lib/include/jxl/version.h
sed -i 's/JPEGXL_EMSCRIPTEN/& AND JPEGXL_BUNDLE_LIBPNG/' third_party/CMakeLists.txt

mkdir __build
cd __build
$CMAKE_COMMAND .. -DCMAKE_INSTALL_PREFIX=/usr/local -DCMAKE_FIND_ROOT_PATH=/usr/local -DCMAKE_BUILD_TYPE=$CMAKE_BUILD_TYPE -DJPEGXL_STATIC=true -DBUILD_TESTING=false -DJPEGXL_ENABLE_TOOLS=false -DJPEGXL_ENABLE_SKCMS=false -DJPEGXL_ENABLE_DOXYGEN=false -DJPEGXL_ENABLE_MANPAGES=false -DJPEGXL_ENABLE_SJPEG=false -DJPEGXL_ENABLE_EXAMPLES=false -DJPEGXL_ENABLE_BENCHMARK=false -DJPEGXL_ENABLE_FUZZERS=false -DJPEGXL_BUNDLE_LIBPNG=false -DJPEGXL_ENABLE_JPEGLI_LIBJPEG=false -DCMAKE_C_FLAGS="$FLAGS"  -DCMAKE_CXX_FLAGS="$FLAGS"
$MAKE install
