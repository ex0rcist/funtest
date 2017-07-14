require 'rails_helper'

describe RateUpdaterService do
  describe 'update!' do
    it 'behaves correctly' do
      allow(RateUpdaterService).to receive(:rate_value).and_return('10')
      expect(Rails.cache).to receive(:write).with('rate', '10')

      RateUpdaterService.update!
    end
  end
end
