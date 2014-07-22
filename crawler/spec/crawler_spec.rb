require 'spec_helper'

describe Crawler do
  describe '.Start' do
    it 'calls Process.fork' do
      expect(Process).to receive(:fork)
      Crawler.Start
    end
  end
end
