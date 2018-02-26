#!/usr/bim/env bash

set -e

echo "check source is downloaded"

if [ ! -d "gcc" ]; then
    bash ./download.sh
    cd gcc
    ./contrib/download_prerequisites
    cd -
else
    bash ./update.sh
fi

echo "check source is finish!"

mkdir -p build
cd build
../gcc/configure --prefix=/opt/gcc-devel --enable-checking=release --enable-languages=c,c++ --disable-multilib
make -j 4
sudo make install

exit 0

