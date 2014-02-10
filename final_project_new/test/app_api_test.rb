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

  def test_all_methods
    server_response = get '/resources'
    assert_equal 200, last_response.status

    server_response = get '/resources/1'
    assert_equal 200, last_response.status

    server_response = get '/resources/1/bookings'
    assert_equal 200, last_response.status

    server_response = get '/resources/1/availability'
    assert_equal 200, last_response.status


    server_response = post '/resources/1/bookings'
    assert_equal 200, last_response.status

    server_response = delete '/resources/1/bookings/1'
    assert_equal 200, last_response.status

    server_response = put '/resources/1/bookings/1'
    assert_equal 200, last_response.status
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
