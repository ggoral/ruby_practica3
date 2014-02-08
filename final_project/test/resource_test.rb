require 'test_helper'

class ResourceTest < Minitest::Unit::TestCase
  include Rack::Test::Methods

  def setup
    @resource = Resource.new("aName","aDescription")
  end

  def resource
    Sinatra::Application
  end

  def test_accessors
    assert_equal("aName", @resource.name)
    assert_equal("aDescription", @resource.description)
  end

end
