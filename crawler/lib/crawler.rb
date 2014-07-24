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
    new.run
  end

  def run
    @agent ||= Mechanize.new
    @agent.get 'http://www.dmm.co.jp/live/chat/'
    boxes = @agent.page/'//li[@class="listbox waitingbox"]'
    array = boxes.map do |box|
      {
        url: (box/'a').attr('href').value,
        name: (box/'span[@class="name"]').text.strip
      }
    end
  end
end
