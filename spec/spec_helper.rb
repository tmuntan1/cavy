ENV['RAILS_ENV'] ||= 'test'

require File.expand_path("../dummy/config/environment.rb",  __FILE__)

require 'rspec/rails'
require 'factory_girl_rails'
require 'capybara/rails'
require 'capybara/rspec'
require 'simplecov'
require 'coveralls'
require 'factory_girl_rails'
require 'database_cleaner'
require 'pry'

if ENV['TRAVIS']
  Coveralls.wear!
else
  SimpleCov.start
end

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.mock_with :rspec
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
  config.include FactoryGirl::Syntax::Methods
  config.include Capybara::DSL
  config.include AuthMacros
  config.include MailerMacros
  config.include Cavy::Engine.routes.url_helpers
  config.before(:each, type: :controller) { @routes = Cavy::Engine.routes }
  config.before(:each, type: :routing)    { @routes = Cavy::Engine.routes }

  config.before(:each) do
    reset_email
    DatabaseCleaner.clean_with :truncation, except: [ActiveRecord::InternalMetadata.table_name]
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
