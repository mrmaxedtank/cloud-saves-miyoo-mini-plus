#!/bin/sh
cd $appdir/
sysdir=/mnt/SDCARD/.tmp_update
miyoodir=/mnt/SDCARD/miyoo
LD_LIBRARY_PATH="$appdir/lib:/lib:/config/lib:$miyoodir/lib:$sysdir/lib:$sysdir/lib/parasyte"
PATH="$sysdir/bin:$PATH"
appdir=/mnt/SDCARD/App/CloudUpload
progress=/tmp/rclone_progress

build_infoPanel() {
    local message="$1"
	  local title="Uploading saves"
	
	  infoPanel --title "$title" --message "$message" --persistent &
	  touch /tmp/dismiss_info_panel
    sync
	  sleep 1
}

run_upload() {
  build_infoPanel "Starting upload"
  > $progress
  /mnt/SDCARD/rclone copy -P --stats 5s --stats-one-line -L --no-check-certificate /mnt/SDCARD/Saves/CurrentProfile/ cloud:Onion/saves/retroarch/ > $progress
  progress_message='cat $progress'
  build_infoPanel progress_message
}

run_upload
