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
apt-get install python3-pip
pip3 install --upgrade youtube_dl
pip3 install --user --upgrade streamlink
```

## Install autoTwitchToYouTube
```
git clone "https://github.com/arnicel/autoTwitchToYouTube.git"
cd autoTwitchToYouTube
```

## Define your Twitch User
```
export ATY_TWITCH_USER=????
```

## Start autoTwitchToYouTube
```
pm2 start autoTwitchToYouTube.sh
pm2 save
```
