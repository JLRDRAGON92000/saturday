require 'sinatra'
require 'sinatra/reloader'
require "json"

enable :sessions

get '/' do
  erb :index
end

post '/login' do
  @username = params[:username]
  @password = params[:password]
  session[:user] = @username
  redirect "/home"
end

get "/bomb" do
  erb :bomb
end

get "/logout" do
  session[:user]=nil
  erb :index
end

get "/home" do
  erb :home
end