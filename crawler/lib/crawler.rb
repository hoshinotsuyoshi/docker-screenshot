#!/usr/bin/ruby

class Crawler
  def self.Start
    Process.fork{}
  end
end
