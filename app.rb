
ENV["RACK_ENV"] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require './models/link.rb'
require './models/tag.rb'

class Bookmark < Sinatra::Base

  get '/users/new' do
    erb :sign_in
  end

  post '/users/save' do
    user = User.create(email: params[:email], password: params[:password])
    user.save
    redirect '/users/welcome'
  end

  get '/users/welcome' do
    erb :welcome
  end

  get '/links' do
    @links = Link.all
    erb :links
  end

  get '/links/new' do
    erb :form
  end

  post '/links' do
    link = Link.create(title: params[:title], url: params[:url])
      params[:tags].split.each do |tag|
        link.tags << Tag.create(name: tag)
      end
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
