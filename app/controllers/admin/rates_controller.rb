require 'sidekiq/api'

module Admin
  class RatesController < ApplicationController
    def update
      service = RateOverrideService.new(params[:rate], params[:date])

      if !service.valid?
        render json: service.errors, status: 422
      else
        new_rate, lifetime = service.override!

        RateBroadcastService.broadcast(new_rate)
        RateExpiryService.run(lifetime)

        render json: {}, status: 200
      end
    end
  end
end
