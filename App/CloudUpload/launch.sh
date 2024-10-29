#!/bin/sh
scriptdir=/mnt/SDCARD/App/CloudUpload_custom

touch /tmp/stay_awake

cd $scriptdir
st -q -e sh $scriptdir/script.sh 
