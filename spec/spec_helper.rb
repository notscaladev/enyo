ENV['RAILS_ENV'] = 'test'
require 'simplecov'
SimpleCov.start do
  add_filter 'spec'
  add_filter 'config'
  add_filter 'lib'
  add_filter 'vendor'

  add_group 'Controllers', 'app/controllers'
  add_group 'Models',      'app/models'
  add_group 'Helpers',     'app/helpers'
  add_group 'Mailers',     'app/mailers'
  add_group 'Views',       'app/views'
end if ENV['COVERAGE']

require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rails'
require 'capybara/rspec'
require 'factory_girl/factory'

if ENV['TRAVIS']
  require 'coveralls'
  Coveralls.wear!
end

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
  config.include FactoryGirl::Syntax::Methods
end