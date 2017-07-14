require 'rails_helper'
require 'sidekiq/api'

describe RateExpiryService do
  describe 'run' do
    let(:lifetime) { 10 }

    it 'calls action cable' do
      expect { RateExpiryService.run(lifetime) }.not_to raise_error
    end
  end
end
