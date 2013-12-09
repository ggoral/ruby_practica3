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
  erb :question
end

post '/question' do
  erb :question
end

get '/index' do
  erb :index
end

post '/set' do
  session[:user] = params[:user]
  session[:pass] = params[:pass]
  "Session value set."
end

get '/set' do
  session[:foo] = Time.now
  "Session value set."
end

get '/fetch' do
  "Session user value: #{session[:user]}\n" +
  "Session pass value: #{session[:pass]}"
end

get '/logout' do
  session.clear
  redirect '/'
end

