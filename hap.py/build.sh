#!/bin/bash
sed -i '/^configure_files.*libz/s/^/#/' CMakeLists.txt
sed -i '/^configure_files.*tabix/s/^/#/' CMakeLists.txt
sed -i '/^configure_files.*bgzip/s/^/#/' CMakeLists.txt
sed -i '/^configure_files.*bcftools/s/^/#/' CMakeLists.txt
sed -i '/^configure_files.*samtools/s/^/#/' CMakeLists.txt
mkdir -p build
cd build
#cmake ../ -DCMAKE_INSTALL_PREFIX=$PREFIX -DBOOST_INCLUDEDIR=/usr/include
cmake28 ../ -DCMAKE_INSTALL_PREFIX=$PREFIX -DBOOST_INCLUDEDIR=$HOME/boost_1_55_0_install/include -DBOOST_LIBRARYDIR=$HOME/boost_1_55_0_install/lib
make
rm -f lib/libhts*so
make install
