#!/usr/bin/ruby

class Crawler
  LIMIT = Float::INFINITY
  INTERVAL = 60

  def self.Start
    @count = 0
    while LIMIT > @count
      Process.fork{}
      @count += 1
      sleep INTERVAL
    end
  end
end
