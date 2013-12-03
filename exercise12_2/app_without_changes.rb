require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym

helpers do
  def form(params)
    case params
      when params[:method] == "post" then method = "post"
      when params[:method] == "get" then method = "get"
      else 
        method = "put"
      end
      action = params[:action]
      "<form method=\"#{method}\" action=\"#{action}\">
        <input type="hidden" name="_method" value="put" />
      </form>"
  end
end

get '/' do
  erb :index
end
