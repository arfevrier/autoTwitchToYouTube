#!/bin/bash
cd /tmp
while true
do
	streamer_name=$ATY_TWITCH_USER
	timestamp=$(date +%s)
	timedate=$(date)
	streamlink twitch.tv/$streamer_name best --twitch-disable-hosting -o ${streamer_name}_$timestamp.mp4 > /dev/null
	(youtube-upload --title="${streamer_name^} Live $timestamp $timedate" --privacy=unlisted --playlist="Live SAUVEGARDE" ${streamer_name}_$timestamp.mp4 > /dev/null 2>&1; if test -f "${streamer_name}_$timestamp.mp4"; then echo "Fichier ${streamer_name}_$timestamp.mp4 envoyé"; fi; rm ${streamer_name}_$timestamp.mp4 > /dev/null)&
	sleep 1m
done
