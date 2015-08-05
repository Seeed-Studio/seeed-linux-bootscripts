#!/bin/bash -e

#needs: alsa-utils

if ! id | grep -q root; then
	echo "must be run as root"
	exit
fi

amixer -c0 sset 'PCM' 119
amixer -c0 sset 'Line DAC' 108
amixer -c0 sset 'Left PGA Mixer Mic2L' unmute
amixer -c0 sset 'Right PGA Mixer Mic2R' unmute
amixer -c0 sset 'PGA' 10

echo "#Recording: 10 seconds"
arecord -Dplughw:0,0 -fcd -d10 -c2 > /tmp/music.wav

echo "#Playback:"
aplay -Dplughw:0,0 /tmp/music.wav