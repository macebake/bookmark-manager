ENV["RACK_ENV"] = "test"

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require './models/link'
require './app'
require 'database_cleaner'



Capybara.app = Bookmark
RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)

  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end
