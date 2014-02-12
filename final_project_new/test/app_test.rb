require 'test_helper'

class AppTest < Minitest::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def setup
    #ActiveRecord::Base.connection.execute('DELETE FROM SQLITE_SEQUENCE WHERE name="resources";') 
    #ActiveRecord::Base.connection.execute('DELETE FROM SQLITE_SEQUENCE WHERE name="bookings";')
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.start
    @resource = Resource.create( name: 'Computadora', description: 'Notebook con 4GB de RAM y 256 GB de espacio en disco con Linux')
    @booking = @resource.bookings.create(start: Date.today, end: (Date.today+1), status: 'pending')
  end

  def teardown
    DatabaseCleaner.clean
  end

  def assert_content_type_is_json(response)
    content_type = response.headers['Content-Type']
    assert_equal 'application/json;charset=utf-8', content_type
  end

  def test_get_root
    get '/'
    assert_content_type_is_json last_response
    assert_equal 404, last_response.status
  end

  def test_fail_resource_lower_limit
    server_response = get '/resources/0'
    assert_equal 404, last_response.status
  end

  def test_first_resource
    server_response = get "/resources/#{Resource.first.id}"
    assert_equal 200, last_response.status
  end

  def test_last_resource
    server_response = get "/resources/#{Resource.last.id}"
    assert_equal 200, last_response.status
  end

  def test_fail_resource_upper_limit
    upper_limit = Resource.all.size + 1
    server_response = get "/resources/#{upper_limit}"
    assert_equal 404, last_response.status
  end

end
