require 'test_helper'
require 'minitest/autorun'

class AppTest < Minitest::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
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

end
