#!/bin/sh
# ~/Library/Preferences/Macromedia/Flash Player/Logs/flashlog.txt

#google-chrome --disable-web-security --ignore-certificate-errors

/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222  --user-data-dir=${HOME}/devchrome --proxy-server="127.0.0.1:8888"
