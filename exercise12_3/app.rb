require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym

helpers do
  def form(params, &block)
    if [:post,:get].include?(params[:method])
      form_begin = "<form method=\"#{params[:method]}\" action=\"#{params[:action]}\">"
      if block_given?
        form_content = block.call
        form_begin << form_content
      end
      return form_begin << "</form>"
    end

    "<form method=\"post\" action=\"#{params[:action]}\">
      <input type=\"hidden\" name=\"_method\" value=\"#{params[:method]}\"/>
    </form>"
  end

  def submit(value)
    "<input type=\"submit\" value=#{value}>"
  end
end

get '/' do
  erb :index
end

get '/login' do
  form(method: :post, action: '/login') { submit('Entrar') }
end

