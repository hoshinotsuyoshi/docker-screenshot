#!/usr/local/bin/ruby

require 'cgi'
require 'fileutils'
require 'RMagick'

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

3.times do |i|
  `gnome-screenshot --delay=1 --file=#{dir}/#{i}.png --display=:1`

  loop do
    if File.exist? "#{dir}/#{i}.png"
      image = Magick::Image.read("#{dir}/#{i}.png").first
      image.crop!(Magick::NorthWestGravity,width=823,height=638)
      image.crop!(Magick::SouthEastGravity,width=640,height=350)
      image.write "#{dir}/#{i}.png"
      break
    end
    sleep 1
  end
end

#kill chrome
#(killing #fork's pid does not work)

processes = `ps aux`.split("\n")
google = processes.select{|process| process.include? 'google'}.first.split[1].to_i
Process.kill 9, google
