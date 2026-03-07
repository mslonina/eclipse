#!/usr/bin/env bash
set -euo pipefail

# Camera port
PORT="usb:001,001"   # from: gphoto2 --auto-detect

sudo gphoto2 --port=$PORT --set-config datetime=now
