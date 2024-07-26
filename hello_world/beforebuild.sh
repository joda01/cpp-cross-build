#!/bin/bash
rm -rf build
mkdir build
cd build
cmake -DTARGET_SYSTEM=Linux-arm64 ..

make

file imagec

