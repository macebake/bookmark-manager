require 'sinatra/base'
require './models/link.rb'

class Bookmark < Sinatra::Base
  get '/links' do
    @links = Link.all
    erb :links
  end
end
