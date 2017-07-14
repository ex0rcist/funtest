class RateUpdaterService
  class << self
    def update!
      Rails.cache.write('rate', rate_value)
    end

    private

    def rate_value
      response = HTTParty.get('http://api.fixer.io/latest?base=USD&symbols=RUB', format: :json)
      begin
        response['rates']['RUB']
      rescue
        0
      end # TODO: logging maybe
    end
  end
end
