#!/bin/bash

# Every minute, try to download the Twitch stream, and send it to YouTube.
# Everything through pipe, no video file created
while true
do

	# Define some variables
	streamer_name=$ATY_TWITCH_USER
	timedate=$(date)

	# Create the input file. Contains upload parameters
	echo '{"title":"'"${streamer_name^}"' Live - '"$timedate"'","privacyStatus":"unlisted","playlistTitles":["Live SAUVEGARDE"]}' > /tmp/input.$streamer_name

	# Start streamlink and youtubeuploader app
	# - Reupload limit of 10h, because of the 12h upload limit by YouTube
	streamlink_option='best --hls-duration 10:00:00 --twitch-disable-hosting -O'
	streamlink twitch.tv/$streamer_name $streamlink_option 2>/dev/null | youtubeuploader -metaJSON /tmp/input.$streamer_name -filename - >/dev/null 2>&1

	sleep 1m
done
