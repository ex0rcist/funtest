require 'rails_helper'

describe RateOverrideService do
  describe 'run' do
    it 'validates correctly' do
      @service = RateOverrideService.new(10, '2017')
      expect(@service.valid?).to be(false)
      expect(@service.errors).to eq('date' => 'Некорректный формат даты')
    end

    it 'validates correctly' do
      @service = RateOverrideService.new('1a', '2017-01-01 00:00:00')
      expect(@service.valid?).to be(false)
      expect(@service.errors).to eq('rate' => 'Некорректный формат курса', 'date' => 'Дата в прошлом')
    end

    it 'validates correctly' do
      @service = RateOverrideService.new('10', (Time.zone.now + 10.seconds).strftime('%Y-%m-%d %H:%M:%S'))
      expect(@service.valid?).to be(true)
      expect(@service.errors).to eq({})
    end
  end
end
