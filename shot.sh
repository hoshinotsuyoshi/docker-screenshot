vncserver :1 -geometry 1280x800 -depth 24 && \
gnome-screenshot --delay=10 --file=/root/image_dir/1.png --display=:1 & \
gnome-screenshot --delay=12 --file=/root/image_dir/2.png --display=:1 & \
gnome-screenshot --delay=14 --file=/root/image_dir/3.png --display=:1 & \
gnome-screenshot --delay=16 --file=/root/image_dir/4.png --display=:1 & \
google-chrome --no-sandbox --user-data-dir=/root/chrome_data_dir $1
