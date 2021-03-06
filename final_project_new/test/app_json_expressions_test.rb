require 'test_helper'

class AppTest < Minitest::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def setup
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.start
    Resource.destroy_all
    Booking.destroy_all
    @resource = Resource.create( name: 'Computadora', description: 'Notebook con 4GB de RAM y 256 GB de espacio en disco con Linux')
    @booking = @resource.bookings.create(start: Time.now.utc.iso8601.to_date , end: (Time.now.utc.iso8601.to_date+1), status: 'pending')
  end

  def teardown
    Resource.destroy_all
    Booking.destroy_all
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
          ]
      }
    matcher = assert_json_match pattern, server_response.body
  end

  def test_json_first_resource
    server_response = get "/resources/#{Resource.first.id}"
    assert_equal 200, last_response.status

    json = JSON.parse server_response.body
    assert resource = json['resource']

    resource = Resource.first
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

def test_json_booking
    server_response = get "/resources/#{@resource.id}/bookings/#{@booking.id}"
    assert_equal 200, last_response.status
    json = JSON.parse server_response.body
    assert booking = json
    
    booking = @booking
    pattern = {        
      from: String,
      to: String,
      status: booking.status,
      links:[
        {  
          rel: "self",
          uri: String 
        },
        {  
          rel: "resource",
          uri: String
        },
        {  
          rel: "accept",
          uri: String,
          method: "PUT"
        },
        {  
          rel: "reject",
          uri: String, 
          method: "DELETE"
        }
      ]  
    }
    matcher = assert_json_match pattern, server_response.body  
  end

def test_json_bookings
    server_response = get "/resources/#{@resource.id}/bookings/#{@booking.id}"
    assert_equal 200, last_response.status
    json = JSON.parse server_response.body
    assert booking = json
    
    booking = @booking
    pattern = {        
      from: String,
      to: String,
      status: booking.status,
      links:[
        {  
          rel: "self",
          uri: String 
        },
        {  
          rel: "resource",
          uri: String
        },
        {  
          rel: "accept",
          uri: String,
          method: "PUT"
        },
        {  
          rel: "reject",
          uri: String, 
          method: "DELETE"
        }
      ]  
    }
    matcher = assert_json_match pattern, server_response.body  
  end

end
