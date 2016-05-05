ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/link'
require_relative 'models/tag'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base
  get '/' do
    redirect '/links'
  end

  before do
    @links = Link.all
  end

  get '/links' do
    @tags = Tag.all
    erb :index
  end

  get '/links/new' do
    erb :new_link
  end

  post '/links' do
    link = Link.create(title: params[:title], url: params[:url])
    tag = Tag.create(name: params[:tag])
    link.tags << tag
    link.save
    redirect '/'
  end

  get '/tags/bubbles' do
    erb :bubbles
  end

  get "/tags/#{@search}" do
    erb :search
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
