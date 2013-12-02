require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym

helpers do
  def form (method, action)
    html_form = "<form method=\"#{method}\" action=\"#{action}\">\n</form>"
  end
end

get '/' do
  #form("Metodo1","Accion1")
  erb :index
end
