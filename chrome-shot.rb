#!/usr/bin/ruby

fork do
  #chrome
  `google-chrome --no-sandbox --user-data-dir=/root/chrome_data_dir #{ARGV.first}`
end

#shot
sleep 12
require 'fileutils'

FileUtils.mkdir_p '/data/web/public'
`gnome-screenshot --delay=1 --file=/data/web/public/1.png --display=:1`
`gnome-screenshot --delay=1 --file=/data/web/public/2.png --display=:1`
`gnome-screenshot --delay=1 --file=/data/web/public/3.png --display=:1`
