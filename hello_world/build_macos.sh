#!/bin/bash
rm -rf build
mkdir build
cd build

export CROSS_TRIPLE=x86_64-apple-darwin
export PATH=/usr/osxcross/bin/:$PATH


crossbuild cmake ..
crossbuild make

file imagec

