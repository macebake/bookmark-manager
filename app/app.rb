ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/link'
require_relative 'models/tag'
require_relative 'models/user'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base

  # helpers do
  #   def current_user
  #     @current_user ||= User.get(session[:user_id])
  #   end
  # end

  enable :sessions
  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    @tags = Tag.all
    @user = User.get(session[:user_id])
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
    user = User.get(session[:user_id])
    user.links << link
    user.save
    redirect '/'
  end

  get '/sign_up/new' do
    erb :sign_up
  end

  post '/sign_up' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    user.save
    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.all(name: params[:name])
    @links = (tag ? tag.links : [])
    erb :search
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
