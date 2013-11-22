require 'test_helper'

class AppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end


  def test_get_uno
    get '/uno'
    assert_equal 200, last_response.status
    assert last_response.body.include?('/uno') 
  end

  def test_get_dos
    get '/dos'
    assert_equal 200, last_response.status
    assert last_response.body.include?('/dos') 
  end

  def test_get_tres
    get '/tres'
    assert_equal 200, last_response.status
    assert last_response.body.include?('/tres') 
  end
end
