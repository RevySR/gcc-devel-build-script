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
../gcc/configure --prefix=/opt/gcc-devel -v --with-pkgversion='gcc-devel' --enable-languages=c,c++  --program-prefix=x86_64-pc-linux-gnu- --enable-shared --enable-threads=posix --enable-nls --enable-clocale=gnu --enable-libstdcxx-debug --enable-libstdcxx-time=yes --with-default-libstdcxx-abi=new --enable-gnu-unique-object --disable-vtable-verify --enable-libmpx --enable-plugin --with-system-zlib --with-target-system-zlib --disable-werror --with-abi=m64 --disable-multilib --with-tune=generic --enable-offload-targets=nvptx-none --without-cuda-driver --enable-checking=release --build=x86_64-pc-linux-gnu --host=x86_64-pc-linux-gnu --target=x86_64-pc-linux-gnu
make -j 4
sudo make install

exit 0

