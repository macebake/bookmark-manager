ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/link'
require_relative 'models/tag'

class BookmarkManager < Sinatra::Base
  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    @tags = Tag.all
    erb :index
  end

  get '/links/new' do
    erb :new_link
  end

  post '/links' do
    Link.create(title: params[:title], url: params[:url], tag: params[:tag])
    # Tag.create(name: params[:tag])
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
