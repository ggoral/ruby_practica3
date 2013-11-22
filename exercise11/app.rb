require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym

helpers do
  def now
    Time.now  
  end
end

['/uno', '/dos', '/tres'].each do |ruta|
  get ruta do
    @action_name = ruta
    erb :index
  end
end

