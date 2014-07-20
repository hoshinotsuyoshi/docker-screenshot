#!/usr/bin/ruby

require 'fileutils'

FileUtils.mkdir_p '/data/web/public'
`gnome-screenshot --delay=1 --file=/data/web/public/1.png --display=:1`
`gnome-screenshot --delay=1 --file=/data/web/public/2.png --display=:1`
`gnome-screenshot --delay=1 --file=/data/web/public/3.png --display=:1`
