require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym

require_relative 'models/resource'

helpers do
  def edit_resource_url(resource)
    "http://example.com/resources/#{resource.id}/edit"
  end

  def edit_resources_url()
    "http://example.com/resources/"
  end
end

get '/resources' do
    
  @resources = $resources
  @links = [1]

  jbuilder :resources
end

get '/resources/:number' do
  halt 404 if params[:number].to_i == 0 
  resource_number = params[:number].to_i - 1
# Sino existe el valor que buscamos te deuvelve un 404
  unless ($resources.detect {|resource| resource["id"] != resource_number })
    halt 404
  end
  
  @resource = $resources[resource_number]
  @resource.links = $resources[resource_number].links
  jbuilder :resource
end

get '/resources/:number/availability' do
  puts "response"
end

get '/resources/:number/bookings' do
  puts "response #{params}"
end



