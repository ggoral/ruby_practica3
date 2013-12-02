require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym

helpers do
  def form (method, action)
    "<form method=#{method} action=#{action}>
     </form>"
  end
end

get '/' do
  erb :index
end
