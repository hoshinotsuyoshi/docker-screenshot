#!/bin/bash

vncserver :1 -geometry 1280x800 -depth 24 && \
gnome-screenshot --delay=14 --file=/data/1.png --display=:1 & \
google-chrome --no-sandbox --user-data-dir=/root/chrome_data_dir $1
