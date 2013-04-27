require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :index
end

post '/login' do
  @username = params[:username]
  @password = params[:password]
  if @username=="JLRDRAGON92000"
    if @password=="lolfail"
      erb :home
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