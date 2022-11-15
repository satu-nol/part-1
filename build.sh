#!/bin/bash
set -e

while getopts ":e:l:f:abcdrsu" option; do
  case $option in
    a) scripts/build_arch.sh ;;
    c) rm -rf .build* ;;
    *) ;;
  esac
done