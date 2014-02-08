require 'test_helper'
require 'json_expressions/minitest'

class AppTest < Minitest::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_all_methods
    server_response = get '/resources'
    assert_equal 200, last_response.status

    server_response = get '/resources/1'
    assert_equal 200, last_response.status

    server_response = get '/resources/1/availability'
    assert_equal 200, last_response.status

    server_response = get '/resources/1/bookings'
    assert_equal 200, last_response.status

    server_response = post '/resources/1/bookings'
    assert_equal 200, last_response.status

    server_response = delete '/resources/1/bookings/1'
    assert_equal 200, last_response.status

    server_response = put '/resources/1/bookings/1'
    assert_equal 200, last_response.status

    server_response = get '/resources/1/bookings/1'
    assert_equal 200, last_response.status
  end

  def test_resources
    server_response = get '/resources'
    assert_equal 200, last_response.status

    json = JSON.parse server_response.body

    assert resources = json['resources']
    pattern = {        
        resources: [
            name: String,
            description: String,
            links: Array, 
          ] * json['resources'].length,
        links: [
          rel: String,
          uri: String,
          ],
      }
    matcher = assert_json_match pattern, server_response.body
    #puts json
  end
#buscar mock stub
  def test_first_resource
    server_response = get '/resources/1'
    assert_equal 200, last_response.status

    json = JSON.parse server_response.body
    assert resources = json['resource']

    pattern = {        
        resource: {
            name: 'Computadora',
            description: 'Notebook con 4GB de RAM y 256 GB de espacio en disco con Linux',
            },
        links: [
          rel: String,
          uri: String,
          ],
      }
    #puts json
  end

  def test_fail_resource
    server_response = get '/resources/0'
    assert_equal 404, last_response.status
  end

 # def test_fail_resource
 #   server_response = get '/resources/400'
 #   assert_equal 404, last_response.status
 # end

end
