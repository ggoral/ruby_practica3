require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym

helpers do
  def form(params)
    if [:post,:get].include?(params[:method])
      return "<form method=\"#{params[:method]}\" action=\"#{params[:action]}\"></form>"
    end

    "<form method=\"post\" action=\"#{params[:action]}\">
      <input type=\"hidden\" name=\"_method\" value=\"#{params[:method]}\"/>
    </form>"
  end
end

get '/' do
  erb :index
end
