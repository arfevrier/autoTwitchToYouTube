#!/bin/bash

# Move to tmp folder, only a simple "input" file will be created
cd /tmp

# Every minute, try to download the Twitch stream, and send it to YouTube.
# Everything through pipe, no video file created
while true
do

	# Define some variables
	streamer_name=$ATY_TWITCH_USER
	timestamp=$(date +%s)
	timedate=$(date)

	# Create the input file. Contains upload parameters
	echo '{"title":"'"${streamer_name^}"' Live - '"$timedate"'","privacyStatus":"unlisted","playlistTitles":["Live SAUVEGARDE"]}' > input

	# Start streamlink and youtubeuploader app
	streamlink twitch.tv/$streamer_name best -O 2>/dev/null | youtubeuploader -metaJSON input -filename - >/dev/null 2>&1

	sleep 1m
done
