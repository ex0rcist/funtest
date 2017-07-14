class RateBroadcastService
  CHANNEL = 'rate_channel'.freeze

  def self.broadcast(rate)
    ActionCable.server.broadcast CHANNEL, message: { rate: rate }
  end
end
