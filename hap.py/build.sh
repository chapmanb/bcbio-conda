#!/bin/bash
sed -i -e '/^configure_files.*libz/s/^/#/' CMakeLists.txt
sed -i -e '/^configure_files.*tabix/s/^/#/' CMakeLists.txt
sed -i -e '/^configure_files.*bgzip/s/^/#/' CMakeLists.txt
sed -i -e '/^configure_files.*bcftools/s/^/#/' CMakeLists.txt
sed -i -e '/^configure_files.*samtools/s/^/#/' CMakeLists.txt
mkdir -p build
cd build
if [ -n "$OSX_ARCH" ]; then
    # OSX: Build cmake pointing to Boost installed by homebrew
    cmake ../ -DCMAKE_INSTALL_PREFIX=$PREFIX -DBOOST_INCLUDEDIR=/usr/local/include -DBOOST_LIBRARYDIR=/usr/local/lib
elif [ -x "/usr/bin/cmake28" ]; then
    # Unix: assume CentOS 5 for standard package build
     cmake28 ../ -DCMAKE_INSTALL_PREFIX=$PREFIX -DBOOST_INCLUDEDIR=$HOME/boost_1_55_0_install/include -DBOOST_LIBRARYDIR=$HOME/boost_1_55_0_install/lib
else
    # Recent ubuntu with boost installed in packages
    cmake ../ -DCMAKE_INSTALL_PREFIX=$PREFIX -DBOOST_INCLUDEDIR=/usr/include -DBOOST_LIBRARYDIR=/usr/lib
fi
make
rm -f lib/libhts*so
make install
