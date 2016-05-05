
ENV["RACK_ENV"] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require './models/link.rb'
require './models/tag.rb'

class Bookmark < Sinatra::Base

  enable :sessions

  get '/links' do
    @links = Link.all
    erb :links
  end
  get '/links/new' do
    erb :form
  end
  post '/links' do
    link = Link.create(title: params[:title], url: params[:url])
    tag = Tag.create(name: params[:tags])
    link.tags << tag
    link.save
    redirect '/links'
  end

  get "/links/tags" do
    tag = Tag.first(name: params[:filter])
    @links = tag ? tag.links : []
    erb :links
  end

 run! if app_file == $0
end
