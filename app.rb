require 'sinatra'
require 'sinatra/reloader'
require "json"
require 'koala'

enable :sessions

get '/' do
  erb :index
end

get "/login" do
  erb :login
end

post '/login' do
  @username = params[:username]
  @password = params[:password]
  if !@username or !@password then
    @error="Invalid entry: Field cannot be blank"
    erb :login
  else
  session[:user] = @username
  redirect "/home"
end
end

get "/bomb" do
  erb :bomb
end

get "/logout" do
  session[:user]=nil
  erb :index
end

get "/home" do
  if(session[:user]).downcase=="collin" then
    erb :rickroll
  else
  erb :home
end
end

get "/secret" do
  return redirect "/" unless session[:user]
  @graph=Koala::Facebook::API.new
  @picture=@graph.get_picture("jpozelc")
  erb :secret
end

get "/search" do
  erb :google
end

post "/search" do
  @search=params[:search]
  redirect "http://www.google.com/search?q=#{@search}"
end