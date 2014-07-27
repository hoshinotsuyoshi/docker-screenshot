#!/usr/bin/ruby

require 'mechanize'

class Crawler
  LIMIT = Float::INFINITY
  INTERVAL = 60

  def intialize
    @agent = Mechanize.new
  end

  def self.Start
    @count = 0
    while LIMIT > @count
      Process.fork do
        Crawler.run
      end
      @count += 1
      sleep INTERVAL
    end
  end

  def self.run
    @rooms ||= []
    @instance ||= new
    @rooms = @instance.run rescue nil
    @instance.shot_all(@rooms)
  end

  def run
    @agent ||= Mechanize.new
    @agent.get 'http://www.dmm.co.jp/live/chat/'
    boxes = @agent.page/'//li[@class="listbox waitingbox"]'
    boxes.map do |box|
      {
        url: (box/'a').attr('href').value,
        name: (box/'span[@class="name"]').text.strip
      }
    end
  end

  def shot_all(rooms)
    rooms.each_with_index do |room,i|
      shot room[:url]
      #break if i.zero? #FIXME
      break if i == 2 #FIXME
    end
  end

  def shot(url)
    `/chrome-shot.rb "#{url}"`
  end
end
