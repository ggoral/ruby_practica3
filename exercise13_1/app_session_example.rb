require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym

configure do
  enable :sessions
end

before do
  content_type :txt
end

get '/set' do
  session[:foo] = Time.now
  "Session value set."
end

get '/fetch' do
  "Session value: #{session[:foo]}"
end

get '/logout' do
  session.clear
  redirect '/fetch'
end

