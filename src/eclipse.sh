#!/usr/bin/env bash
set -euo pipefail

# todos: 
# - add multiple cameras support (sth like eclipse --camera=D300s)
# - get port from autodetect
# - test on multiple cameras attached to single Mac
# - add eclipse phase automation based on location config to trigger exposures before and
# after totality

# Camera port
PORT="usb:001,001"   # from: gphoto2 --auto-detect

# Bracket centers, todo: avoid longer exposures, and set them explicitly after bursts
BRACKET_CENTERS=("1/8000" "1/4000" "1/2000" "1/1000" "1/500" "1/250" "1/125" "1/60" "1/30" "1/15" "1/8" "1/4" "1/2") # "1/4" "1/2" "37" "40")

# Needs to set this to avoid device busy error, good value is .5, edge value is .25
SLEEP=.25

# burst mode frames (max bracketing for D850 is 9 frames)
BURST=9

#echo "reading capturetarget"
#sudo gphoto2 --port "$PORT" --get-config capturetarget
#echo "capture target set to 1"
#sudo gphoto2 --port "$PORT" --set-config capturetarget=1
#sudo gphoto2 --port "$PORT" --get-config capturetarget

for s in "${BRACKET_CENTERS[@]}"; do
	echo "speed: $s"
  sudo gphoto2 --port "$PORT" \
    --set-config /main/actions/viewfinder=1 \
    --set-config shutterspeed="$s" \
    --set-config burstnumber=$BURST \
    --trigger-capture
  sleep $SLEEP
  # Optional safety: confirm it applied (parse Current: from --get-config shutterspeed)
  #sudo gphoto2 --port "$PORT" --get-config shutterspeed | sed -n 's/^Current: //p'
  #sudo gphoto2 --port "$PORT" --trigger-capture     # --capture-image is slow; keep on card; download later
done

