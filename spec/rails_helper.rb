# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort('The Rails environment is running in production mode!') if Rails.env.production?

require 'spec_helper'
require 'rspec/rails'

# Add additional requires below this line. Rails is not loaded until this point!

require 'fakeredis/rspec'

require 'capybara'
require 'capybara/rspec'
require 'capybara/rails'
require 'capybara/webkit'

# Checks for pending migration and applies them before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

# хитрый хак, чтобы сайдкик подцепил фековый редис
# redis_opts = {url: 'redis://127.0.0.1:6379/1', namespace: 'cms_queue'}
# If fakeredis is loaded, use it explicitly
# redis_opts[:driver] = Redis::Connection::Memory if defined?(Redis::Connection::Memory)

# Sidekiq.configure_client do |config|
#   config.redis = redis_opts
# end
#
# Sidekiq.configure_server do |config|
#   config.redis = redis_opts
# end

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories.
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.tty = true

  config.include WaitForAjax, type: :feature

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end
