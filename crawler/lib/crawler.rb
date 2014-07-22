#!/usr/bin/ruby

class Crawler
  LIMIT = Float::INFINITY
  def self.Start
    @count = 0
    while LIMIT > @count
      Process.fork{}
      @count += 1
    end
  end
end
