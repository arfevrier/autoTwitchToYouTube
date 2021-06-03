
# autoTwitchToYouTube 🔴 > 📼 > 📺

> *Create your livestreams backup library*

The script **autoTwitchToYouTube** was created to record a broadcast from the Twitch platform on YouTube, in order to watch the stream later.
Broadcasts are downloaded in best quality, no transcoding, the stream is directly sent back to YouTube. With the use of shell pipe, no video is store in disk. What you need is the username of the Twitch channel, every minute the shell script check if a broadcast has started.
 - [x] No local disk use
 - [x] Video uploaded to YouTube in live

## Installation 
### PM2
*pm2* is use to daemon the shell script.
```
apt-get install npm
npm install pm2 -g
pm2 startup
```
### Dependencies: Streamlink and YouTubeUploader
```
apt-get install python3-pip tar
pip3 install --upgrade streamlink
```
You have to download the last release of the pre-compiled YouTubeUploader using their Github: https://github.com/porjo/youtubeuploader
```
tar -xvf youtubeuploader_linux_amd64.tar.gz
mv youtubeuploader_linux_amd64 /usr/local/bin/youtubeuploader
```
### Download autoTwitchToYouTube
```
git clone "https://github.com/arnicel/autoTwitchToYouTube.git"
cd autoTwitchToYouTube
```
## Finish setup
Last step, set up your credentials to allow YouTubeUploader to upload videos to the YouTube platform. You need to create a Google API application on the Google console. After, your application created, YouTube API V3 activated, and OAuth 2.0 configured, download your client secret to "*./client_secrets.json*" from:
https://console.cloud.google.com/apis/dashboard
*Check directly the documentation of YouTubeUploader  for more information*

Finish setup of YouTubeUploader:
```
youtubeuploader -headlessAuth -filename <any file>
```
## Use

### Define the Twitch Username
This is the name of the Twitch user whose broadcast will be automatically uploaded to YouTube.
```
export ATY_TWITCH_USER=<username>
```

### Start autoTwitchToYouTube
```
pm2 start autoTwitchToYouTube.sh --name $ATY_TWITCH_USER
pm2 save
```
