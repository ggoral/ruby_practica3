require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym

get '/codigo' do
  'Hello Code'
end

get '/codigo/:code' do
  Integer(params[:code])
end

not_found do
  'Ruta no encontrada'
end

error do
  'Disculpá, ocurrió un error horrible - ' +
    env['sinatra.error'].name
end
