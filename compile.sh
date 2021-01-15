#!/usr/bin/env bash
# Custom compile script

export CC=ccache clang
export ARCH=arm64
export SUBARCH=arm64
export PATH=/home/phantom/dev/toolchain/bin:$PATH

make ARCH=arm64 lineage-gtaxlwifi_defconfig
make -j$(nproc --all) \
                      ARCH=arm64 \
                      CC=clang \
                      CLANG_TRIPLE=aarch64-linux-gnu- \
                      CROSS_COMPILE=aarch64-linux-android- \
                      | tee kernel.log
