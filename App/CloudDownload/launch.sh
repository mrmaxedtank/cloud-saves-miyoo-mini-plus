#!/bin/sh
scriptdir=/mnt/SDCARD/App/CloudDownload_custom

touch /tmp/stay_awake

cd $scriptdir
st -q -e sh $scriptdir/script.sh 
