require 'rails_helper'

describe RateBroadcastService do
  describe 'broadcast' do
    let(:rate) { 10 }

    it 'calls action cable' do
      expect(ActionCable.server).to receive(:broadcast).with(RateBroadcastService::CHANNEL, message: { rate: rate })
      RateBroadcastService.broadcast(rate)
    end
  end
end
