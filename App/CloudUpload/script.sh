#!/bin/sh
export LD_LIBRARY_PATH="/mnt/SDCARD/.tmp_update/lib:/config/lib:/lib"

echo "====================================================="
echo "Fixing clock"
ntpd -N -p 162.159.200.1
hwclock -w
sleep 3
echo "====================================================="
/mnt/SDCARD/rclone copy -P -L --no-check-certificate /mnt/SDCARD/Saves/CurrentProfile/ cloud:Onion/saves/retroarch/
#/mnt/SDCARD/rclone copy -P --stats 1s --stats-one-line -L --no-check-certificate /mnt/SDCARD/Saves/CurrentProfile/ cloud:Onion/saves/retroarch/
echo "====================================================="
echo "Sleeping for 10 seconds"

sleep 10
