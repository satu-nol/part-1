#!/bin/bash
set -e

configure_app()
{
  cmake \
  -DCMAKE_TOOLCHAIN_FILE="cmake/gnuarm.cmake" \
  -G "Ninja" -DCMAKE_BUILD_TYPE=Release -B.build-app .
}

compile_app()
{
  ninja -C .build-app -j 8
}

build_app()
{
  configure_app && compile_app
}

build_app
