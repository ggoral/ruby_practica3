require 'test_helper'

class ResourceTest < Minitest::Unit::TestCase
  include Rack::Test::Methods
  include Sinatra::Helpers

  def app
    Sinatra::Application
  end

  def setup
    Resource.delete_all
    @resource = nil
    #@resource = Resource.new("aName","aDescription")
  end

  def test_accessors
    assert_equal("aName", @resource.name)
    assert_equal("aDescription", @resource.description)
  end

end

