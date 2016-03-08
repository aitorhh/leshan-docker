#!/bin/sh

MACHINE_TYPE=`uname -m`
if [ x${MACHINE_TYPE} = xarmv7l ]; then
  # for ARM machines, use a different tag
  export LESHAN_CONTAINER_TAG=gebart/leshan:armhf
else
  # default to x86
  export LESHAN_CONTAINER_TAG=gebart/leshan:latest
fi
