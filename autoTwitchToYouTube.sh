#!/bin/bash

# Every minute, try to download the Twitch stream, and send it to YouTube.
# Everything through pipe, no video file created
while true
do

	# Define some variables
	streamer_name=$ATY_TWITCH_USER
	timestamp=$(date +%s)
	timedate=$(date)

	# Create the input file. Contains upload parameters
	echo '{"title":"'"${streamer_name^}"' Live - '"$timedate"'","privacyStatus":"unlisted","playlistTitles":["Live SAUVEGARDE"]}' > /tmp/input.$streamer_name

	# Start streamlink and youtubeuploader app
	streamlink twitch.tv/$streamer_name best -O | youtubeuploader -metaJSON /tmp/input.$streamer_name -filename -

	sleep 1m
done
