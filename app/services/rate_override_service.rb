class RateOverrideService
  OVERRIDE_KEY = 'rate_override'.freeze
  RATE_VALIDATION_REGEXP = /\A([0-9]*[.,]{1})?[0-9]+\z/
  DATE_VALIDATION_FORMAT = '%Y-%m-%d %H:%M:%S'.freeze

  attr_reader :errors

  # value: float
  # date: date till rate will live (2017-01-01 00:00:00)
  def initialize(raw_value, raw_date)
    @raw_value = raw_value.to_s
    @raw_date = raw_date

    @current_time = Time.now.to_i

    validate!
  end

  def valid?
    @errors.empty?
  end

  def override!
    return unless valid?

    Rails.cache.write(OVERRIDE_KEY, value, expires_in: lifetime.seconds)
    [value, lifetime]
  end

  private

  def validate!
    @errors = {}

    validate_rate!
    validate_lifetime!
  end

  def validate_rate!
    errors = [].tap do |e|
      e << 'Курс не указан' unless @raw_value.present?
      e << 'Некорректный формат курса' unless @raw_value =~ RATE_VALIDATION_REGEXP
    end

    @errors['rate'] = errors.first if errors.any?
  end

  def validate_lifetime!
    errors = [].tap do |e|
      e << 'Некорректный формат даты' unless parsed_lifetime
      e << 'Дата в прошлом' if lifetime <= 0
    end

    @errors['date'] = errors.first if errors.any?
  end

  def parsed_lifetime
    Time.zone.strptime(@raw_date, DATE_VALIDATION_FORMAT)
  rescue
    nil
  end

  def lifetime
    return 0 unless parsed_lifetime
    parsed_lifetime.to_i - @current_time
  end

  def value
    @raw_value.tr(',', '.').to_f
  end
end
