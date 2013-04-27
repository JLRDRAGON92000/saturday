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
  if @username=="JLRDRAGON92000"
    if @password=="lolfail"
      session[:user]="JLRDRAGON92000"
      redirect "/home"
    else
      @error="Incorrect password"
      erb :index
    end
  else
    @error="Incorrect username"
    erb :index
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
  erb :home
end