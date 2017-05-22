#!/bin/bash

i3status | while :
do
	read line
	song=$(mpc current)
	ram=$(awk '/MemTotal/ {memtotal=$2}; /MemAvailable/ {memavail=$2}; END { printf("%.0f", (100- (memavail / memtotal * 100))) }' /proc/meminfo)

	if [ "$song" != "" ]; then
		echo -n "歌 $song | 記 $ram % | $line" || exit 1
	else
		echo -n "記 $ram % | $line" || exit 1
	fi
done