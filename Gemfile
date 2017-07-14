source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.2'

gem 'puma', '~> 3.7'
gem 'sqlite3'

gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'coffee-rails', '~> 4.2'
gem 'gon'
gem 'httparty'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'sidekiq'
gem 'slim-rails'
gem 'vuejs-rails'
gem 'whenever'

gem 'redis', '~> 3.0'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'capybara-webkit'
  gem 'rspec-rails'

  # gem 'selenium-webdriver'
end

group :test do
  gem 'fakeredis', require: 'fakeredis/rspec'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'

  gem 'awesome_print'
  gem 'pry-byebug'

  gem 'listen', '>= 3.0.5', '< 3.2'

  gem 'rubocop'

  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
