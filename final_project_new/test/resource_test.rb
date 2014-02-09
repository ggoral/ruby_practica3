require 'test_helper'

class ResourceTest < Minitest::Unit::TestCase
  include Rack::Test::Methods
  include Sinatra::Helpers

  def app
    Sinatra::Application
  end

  def setup
    Resource.delete_all
  end

  def test_empty_database
    assert_equal(0, Resource.all.size)
  end

  def test_load_data_database
    assert_equal(0, Resource.all.size)
    @resource = Resource.create(name: "resource1", description: "description1")
    @resource = Resource.create(name: "resource2", description: "description2")
    @resource = Resource.create(name: "resource3", description: "description3")
    assert_equal(3, Resource.all.size)
  end

  def test_accessors
    @resource = Resource.create(name: "aName", description: "aDescription")
    assert_equal("aName", @resource.name)
    assert_equal("aDescription", @resource.description)
  end

  def test_validate_name_presence
    assert(Resource.create(name: "resource", description: "description").valid?)
    assert(Resource.create(name: "resource").valid?)
    refute(Resource.create().valid?)
    refute(Resource.create(description: "description").valid?)
  end

end

