require 'bundler'
require 'active_record'
require 'sinatra'
require 'sinatra/activerecord'

Bundler.require :default, ENV['RACK_ENV'].to_sym

Dir[File.dirname(__FILE__) + '/models/*.rb'].each { |ruby_file| require_relative ruby_file }
Dir[File.dirname(__FILE__) + '/helpers/*.rb'].each { |ruby_file| require_relative ruby_file }

helpers do

  def base_url
    @base_url ||= "#{request.env['rack.url_scheme']}://#{request.env['HTTP_HOST']}"
  end

  def link_path(path, rel=:self, method=nil)
    link = {rel: rel, uri: url(path) }
    if method then link[:method] = method end
    link
  end

  def options_path(path, resource_id = ':resource_id', booking_id = ':booking_id')
    hash_path = {
      "resource" => "#{base_url}/resources/#{resource_id}",
      "resources" => "#{base_url}/resources",
      "resource_availability" => "#{base_url}/resources/#{resource_id}/bookings",
      "resource_bookings" => "#{base_url}/resources/#{resource_id}/bookings",
      "resource_bookings_booking" => "#{base_url}/resources/#{resource_id}/bookings/#{booking_id}",
    }
    hash_path[path]
  end

  def resource_links(resource)
    links = [] << link_path(options_path("resource",resource.id))
    links << link_path(options_path("resource_bookings",resource.id),:bookings)
    links
  end

  def resources_links(resources)
    links = [] << link_path(options_path("resources"))
    links
  end
end

before do
  content_type("json")
end

before '/resources/:resource_id*' do
  @resource = Resource.find_by(id: params[:resource_id])
  halt 404 unless @resource
end

get '/resources/:resource_id' do
  @resource = Resource.find_by(id: params[:resource_id])
  jbuilder :resource
end

get '/resources' do
  @resources = Resource.all
  jbuilder :resources
end

get '/resources/:id_resource/availability' do
end

get '/resources/:id_resource/bookings' do
end

post '/resources/:id_resource/bookings' do
end

delete '/resources/:id_resource/bookings/:id_booking' do
end

put '/resources/:id_resource/bookings/:id_booking' do
end

get '/resources/:id_resource/bookings/:id_booking' do
end
