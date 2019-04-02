#!/bin/bash

if [[ $(uname) == Linux ]]; then
    # By putting this last it takes precedence over
    # the default c++17 flag which causes
    # "error: ISO C++1z does not allow dynamic exception specifications"
    # I would have thought doing this would cause ABI breakage
    # with everything else, but apparently not
    export CXXFLAGS="$CXXFLAGS -std=c++11"
fi

cmake -D CMAKE_INSTALL_PREFIX=$PREFIX \
    -D HDF5_INCLUDE_DIR=$PREFIX/include \
    -D HDF5_LIB_PATH=$PREFIX/lib \
    -D LIBLAS_INCLUDE_DIR=$PREFIX/include \
    -D LIBLAS_LIB_PATH=$PREFIX/lib \
    -D GSL_INCLUDE_DIR=$PREFIX/include \
    -D GSL_LIB_PATH=$PREFIX/lib \
    -D CGAL_INCLUDE_DIR=$PREFIX/include \
    -D CGAL_LIB_PATH=$PREFIX/lib \
    -D BOOST_INCLUDE_DIR=$PREFIX/include \
    -D BOOST_LIB_PATH=$PREFIX/lib \
    -D GDAL_INCLUDE_DIR=$PREFIX/include \
    -D GDAL_LIB_PATH=$PREFIX/lib \
    -D XERCESC_INCLUDE_DIR=$PREFIX/include \
    -D XERCESC_LIB_PATH=$PREFIX/lib \
    -D GMP_INCLUDE_DIR=$PREFIX/include \
    -D GMP_LIB_PATH=$PREFIX/lib \
    -D MPFR_INCLUDE_DIR=$PREFIX/include \
    -D MPFR_LIB_PATH=$PREFIX/lib \
    -D CMAKE_BUILD_TYPE=Release \
    .

make install -j$CPU_COUNT

