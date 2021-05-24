# autoTwitchToYouTube
Use to automatically download Twitch livestream and upload it to YouTube.

## Install PM2
```
apt-get install npm
npm install pm2 -g
pm2 startup
```

## Install dependencies
```
apt-get install python3-pip tar
pip3 install --upgrade streamlink
```
Download last release of https://github.com/porjo/youtubeuploader
```
tar -xvf youtubeuploader_linux_amd64.tar.gz
mv youtubeuploader_linux_amd64 /usr/local/bin/youtubeuploader
```

## Install autoTwitchToYouTube
```
git clone "https://github.com/arnicel/autoTwitchToYouTube.git"
cd autoTwitchToYouTube
```
## Finish setup of YouTubeUploader
Download your client secret to "./client_secrets.json" from:
https://console.cloud.google.com/apis/dashboard

Finish setup of YouTubeUploader:
```
youtubeuploader -headlessAuth -filename tmp.mp4
```

## Define the Twitch User
```
export ATY_TWITCH_USER=<username>
```

## Start autoTwitchToYouTube
```
pm2 start autoTwitchToYouTube.sh
pm2 save
```
