
ENV["RACK_ENV"] ||= 'development'

require 'sinatra/base'
require './models/link.rb'


class Bookmark < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :links
  end
  get '/links/new' do
    erb :form
  end
  post '/links' do
    Link.create(title: params[:title], url: params[:url])
    redirect '/links'
  end

 run! if app_file == $0
end
