require 'sinatra/base'
require 'link.rb'

class Bookmark < Sinatra::Base
  get '/' do
    'Hello'
  end
end
