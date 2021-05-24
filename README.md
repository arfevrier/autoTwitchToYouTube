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
apt-get install python3-pip unzip
pip3 install --upgrade streamlink
pip3 install --upgrade google-api-python-client oauth2client progressbar2
```
```
wget https://github.com/tokland/youtube-upload/archive/master.zip
unzip master.zip && cd youtube-upload-master && python3 setup.py install
```
Download your client secret to "~/.client_secrets.json" from:
https://console.cloud.google.com/apis/dashboard

Finish setup of youtube-upload:
```
youtube-upload tmp.mp4
```

## Install autoTwitchToYouTube
```
git clone "https://github.com/arnicel/autoTwitchToYouTube.git"
cd autoTwitchToYouTube
```

## Define the Twitch User
```
export ATY_TWITCH_USER=????
```

## Start autoTwitchToYouTube
```
pm2 start autoTwitchToYouTube.sh
pm2 save
```
