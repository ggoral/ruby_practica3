require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym

get '/saludo' do
  'Hola Mundo!'
end

get '/saludo/:name' do
  "Hola #{params[:name]}"
end
