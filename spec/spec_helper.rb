require 'capybara'
require 'capybara/rspec'
require 'rspec'
require './models/link'
require './app'

Capybara.app = Bookmark
