class IndexController < ApplicationController
  def index
    # небольшой хак, т.к. при локальном запуске нет начального значения
    RateUpdaterService.update! if Rails.env.development?

    gon.rate = cache('rate_override') || cache('rate')
  end

  private

  def cache(key)
    Rails.cache.read(key)
  end
end
