require 'spec_helper'

describe Crawler do
  describe '.Start' do
    context 'when LIMIT is 3' do
      it 'calls Crawler.run 3 times' do
        stub_const('Crawler::INTERVAL', 0)
        stub_const('Crawler::LIMIT', 3)
        allow(Crawler).to receive(:run).exactly(3)
        Crawler.Start
      end
    end
  end

  describe '.run' do
    it 'calls Crawler#run' do
      allow_any_instance_of(Crawler).to receive(:run)
      Crawler.run
    end
  end
end
