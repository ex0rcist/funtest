class RateExpiryJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    ActionCable.server.broadcast 'rate_channel', message: { rate: Rails.cache.read('rate') }
  end
end
