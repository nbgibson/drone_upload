#!/usr/bin/env bash
cameradir='/Volumes/Untitled/DCIM/100MEDIA/'
[ -d "$cameradir" ] || exit #Verify SD card is mounted 
echo "========================= Moving photos to NAS pool ========================"
for f in "$cameradir"
do
  echo "File: " "$f"
  date=$(stat -f "%Sm" -t "%y.%m.%d" "$f")
  echo "date: " "$date"
  scp -r -p "$f" homenas:/var/services/homes/nate/Photos/Drone/"$date"
done