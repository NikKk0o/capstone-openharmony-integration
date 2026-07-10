#!/usr/bin/env bash

set -Eeuo pipefail

HDC_DIR="$HOME/ohos-robot-toolchain/linux/toolchains"
OH_IP="${OH_IP:-192.168.122.111}"
OH_PORT="${OH_PORT:-55555}"

if [[ ! -x "$HDC_DIR/hdc" ]]; then
    echo "Error: hdc not found at $HDC_DIR/hdc"
    exit 1
fi

export PATH="$HDC_DIR:$PATH"

echo "Connecting to OpenHarmony at ${OH_IP}:${OH_PORT}..."
hdc tconn "${OH_IP}:${OH_PORT}"

echo
echo "Connected targets:"
hdc list targets -v

echo
echo "Opening OpenHarmony shell..."
hdc shell
