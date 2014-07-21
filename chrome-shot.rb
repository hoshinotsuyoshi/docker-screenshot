#!/usr/bin/ruby

require 'cgi'
require 'fileutils'

fork do
  #chrome
  `google-chrome --no-sandbox --user-data-dir=/root/chrome_data_dir #{ARGV.first}`
end

#shot
sleep 12

FileUtils.mkdir_p '/data/web/public'
escaped = CGI.escape ARGV.first
dir     = "/data/web/public/#{escaped}"
FileUtils.mkdir_p dir
`gnome-screenshot --delay=1 --file=#{dir}/1.png --display=:1`
`gnome-screenshot --delay=1 --file=#{dir}/2.png --display=:1`
`gnome-screenshot --delay=1 --file=#{dir}/3.png --display=:1`


#kill chrome
#(killing #fork's pid does not work)

processes = `ps aux`.split("\n")
google = processes.select{|process| process.include? 'google'}.first.split[1].to_i
Process.kill 9, google

