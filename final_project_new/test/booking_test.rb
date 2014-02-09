require 'test_helper'

class BookingTest < Minitest::Unit::TestCase
  include Rack::Test::Methods
  include Sinatra::Helpers

  def app
    Sinatra::Application
  end

  def setup
    Resource.delete_all
    @resource = Resource.create(name: 'aResource', description: 'aDescription')
  end

   def teardown
    Resource.delete_all
    Booking.delete_all
  end

  def test_empty_database
    assert_equal(0, Booking.all.size)
  end

  def test_load_data_database
    assert_equal(0, Booking.all.size)
    @booking = @resource.bookings.create(start: Date.today, end: (Date.today+1), status: 'pending')
    @booking = @resource.bookings.create(start: Date.today, end: (Date.today+1), status: 'pending')
    @booking = @resource.bookings.create(start: Date.today, end: (Date.today+1), status: 'pending')
    assert_equal(3, Booking.all.size)
  end

  def test_validate_presence
    assert(@resource.bookings.create(start: Date.today, end: (Date.today+1), status: 'pending').valid?)
    assert(@resource.bookings.create(start: Date.today, end: (Date.today+1)).valid?)
    refute(Booking.create().valid?)
    refute(Booking.create(resource_id: @resource.id ).valid?)
  end

  def test_validate_inclusion
    booking = Booking.create(resource_id: @resource.id, start: Date.today, end: (Date.today+1))
    booking.status = 'approved'
    assert_equal(booking.status, 'approved')
  end

  def test_callback_set_pending_status
    @booking = @resource.bookings.create(start: Date.today, end: (Date.today+1))
    assert_equal(@booking.status, 'pending')
  end

end
