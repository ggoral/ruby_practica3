require 'test_helper'

class AppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_get_a_user
    server_response = get '/resources/1'
    assert_equal 200, last_response.status

    json = JSON.parse server_response.body
    puts json
    puts json['name']

  end

end
