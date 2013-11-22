require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym

get '/saludo' do
  @template_parameter = 'Hola Mundo!'
  erb :index
end

get '/saludo/:name' do
  @template_parameter = "Hola #{params[:name]}"
  erb :index
end
