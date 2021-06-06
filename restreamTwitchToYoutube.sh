#!/bin/bash

# Every 4 minutes, try to restream the Twitch stream to YouTube Live.
# Everything through pipe, no video file created
while true
do
        # Define some variables
        streamer_name=$ATY_TWITCH_USER
        youtube_stream_key='****-****-****-****-****'
        
        # To remember
        # - re: 
        # - i: input file, sdtin
        # - ar: audio rate: must be 44100 for youtube live
        # - acodec: audio codec: must not be "copy" to force audio rate. Use of "aac", same Twitch audio Codec
        # - vcodec: video codec: simply copy the video part
        # - f: packaging format
        streamlink twitch.tv/$streamer_name best -O 2>/dev/null | ffmpeg -re -i - -ar 44100 -acodec aac -vcodec copy -f flv rtmp://a.rtmp.youtube.com/live2/$youtube_stream_key >/dev/null 2>&1
        sleep 4m
done
