#!/bin/bash

set -ex

# Zero out the free space to save space in the final image
# Ignore no space left on device error
dd if=/dev/zero of=/EMPTY bs=1M || true
rm -f /EMPTY
