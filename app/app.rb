ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/link'
require_relative 'models/tag'
require_relative 'data_mapper_setup'

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
    link = Link.create(title: params[:title], url: params[:url])
    (params[:tag]).split(",").each do |tag|
      link.tags << Tag.create(name: tag)
      link.save
    end
    redirect '/'
  end

  # post '/tags/add' do
  #   link = Link.all[(params[:id].to_i)]
  #   tag = Tag.create(name: params[:tag])
  #   link.tags << tag
  #   link.save
  #   redirect '/'
  # end

  get '/tags/:name' do
    tag = Tag.all(name: params[:name])
    @links = (tag ? tag.links : [])
    erb :search
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
