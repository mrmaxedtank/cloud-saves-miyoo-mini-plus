#!/bin/sh
cd $appdir/
sysdir=/mnt/SDCARD/.tmp_update
miyoodir=/mnt/SDCARD/miyoo
LD_LIBRARY_PATH="$appdir/lib:/lib:/config/lib:$miyoodir/lib:$sysdir/lib:$sysdir/lib/parasyte"
PATH="$sysdir/bin:$PATH"
appdir=/mnt/SDCARD/App/CloudDownload
progress=/tmp/rclone_progress

build_infoPanel() {
	local message="$1"
	local title="Downloading saves"
	
	infoPanel --title "$title" --message "$message" --persistent &
	touch /tmp/dismiss_info_panel
  sync
	sleep 1
}

run_download() {
	build_infoPanel "Starting download"
	> $progress
	/mnt/SDCARD/rclone copy -P -L --no-check-certificate cloud:Onion/saves/retroarch/ /mnt/SDCARD/Saves/CurrentProfile/ > $progress
	progress_message='cat $progress'
	build_infoPanel progress_message
}

run_download
build_infoPanel "Download finished"
