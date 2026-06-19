#!/bin/bash
# InfinityA16 Hardware Patch Automation

echo "Applying display core stability patches..."
cd ../../../hardware/qcom-caf/sm8450/display
git apply ../../../../device/oneplus/wly/patches/0001-patch-out-display.patch
cd ../../../..
echo "Done!"
