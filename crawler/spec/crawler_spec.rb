require 'spec_helper'

describe Crawler do
  describe '.Start' do
    context 'when LIMIT is 3' do
      it 'calls Process.fork 3 times' do
        stub_const('Crawler::LIMIT',3)
        expect(Process).to receive(:fork).exactly(3)
        Crawler.Start
      end
    end
  end
end
