require 'test_helper'

class AppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end


  def test_get_saludo
    get '/saludo'
    assert_equal 200, last_response.status
    assert last_response.body.include?('Hola Mundo!') 
  end


  def test_get_saludo_with_name
    get '/saludo/juan'
    assert_equal 200, last_response.status
    assert last_response.body.include?('juan') 
  end
end
