require 'test_helper'
require 'json_expressions/minitest'

class AppTest < Minitest::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def setup
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.start
    @resource = Resource.create( name: 'Computadora', description: 'Notebook con 4GB de RAM y 256 GB de espacio en disco con Linux')
    @booking = @resource.bookings.create(start: Date.today, end: (Date.today+1), status: 'pending')
  end

  def teardown
    DatabaseCleaner.clean
  end

  def test_json_resources
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
    puts json
    matcher = assert_json_match pattern, server_response.body
  end

  def test_json_resource_1
    server_response = get '/resources/1'
    assert_equal 200, last_response.status

    json = JSON.parse server_response.body
    assert resource = json['resource']

    resource = Resource.find_by(id:1)
    pattern = {        
        resource: {
            name: resource.name,
            description: resource.description,
            links:[
              rel: String,
              uri: String,
              ] * json['resource']['links'].size 
            }
        }
    matcher = assert_json_match pattern, server_response.body  
  end

  def test_fail_resource_lower_limit
    server_response = get '/resources/0'
    assert_equal 404, last_response.status
  end

  def test_fail_resource_upper_limit
    upper_limit = Resource.all.size + 1
    server_response = get "/resources/#{upper_limit}"
    assert_equal 404, last_response.status
  end

end
