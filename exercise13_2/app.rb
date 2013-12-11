require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym

configure do
  enable :sessions
end

get '/' do
  if session.has_key?(:user) and session.has_key?(:profile)
    redirect to('/question')
  else
    redirect to('/login')
  end
end

get '/login' do
  erb :login
end

get '/question' do
  redirect to("/question/#{session[:question_number]}")
  erb :question
end

get '/question/:number' do
  unless session.has_key?(:user) and session.has_key?(:profile)
    redirect to('/login')
  end
  
  #Get Database Question
  session[:question_number] += 1 
  "Question Number? #{params[:number]}"
end

get '/index' do
  erb :index
end

post '/set' do
  #Get Database User & Set Profile
  session[:user] = params[:user]
  session[:pass] = params[:pass]
  session[:profile] = "admin"
  session[:question_number] = 1
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

