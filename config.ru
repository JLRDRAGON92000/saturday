ENV['RACK_ENV'] = "development"

require "rubygems"
require "bundler/setup"

run Sinatra::Application