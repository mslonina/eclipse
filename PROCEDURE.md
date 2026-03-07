# Total Solar Eclipse procedure

## Camera setup

- [ ] - Load full battery
- [ ] - Load empty CF Express card
- [ ] - Turn on camera
- [ ] - Set autofocus to manual (M)
- [ ] - Set lens autofocus to manual (M)
- [ ] - Set Mode to M (manual)
- [ ] - Set burst mode to CH
- [ ] - Set bracketing (BKT) to 9 frames, leave 0.3 as-is
- [ ] - Attach camera to Mac via labelled cable (D850-PC)
- [ ] - Clock sync using `./clock_sync.sh --camera=D850`
- [ ] - Ensure the camera clock timezone is set to UTC, and UTC time in camera is synced
  with PC using `date -z UTC` for verification (should show current time in UTC timezone)
- [ ] - Run auto detect test with `./eclipse.sh --camera=D850 --preflight`
