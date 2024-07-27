#!/bin/bash
rm -rf build
mkdir build
cd build

export CROSS_TRIPLE=x86_64-w64-mingw32 


crossbuild cmake ..
crossbuild make

file imagec

