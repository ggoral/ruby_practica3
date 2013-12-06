require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym

configure do
  enable :sessions
end

get '/' do
  redirect to('/login')
  #redirect '/login'
end

get '/login' do
  erb :login
end

get '/question' do
  erb :login
end

get '/index' do
  erb :index
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
  redirect '/'
end

