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

get '/resources/:number' do
  halt 404 if params[:number].to_i == 0 
  resource_number = params[:number].to_i - 1

  $resources.each { |hashie| puts hashie.id } # aca va un test que verifica que exista el id con un select
  
  @resource = $resources[resource_number]
  @resource.links = $resources[resource_number].links
  jbuilder :resource
end

get '/resources' do
    
  @resources = $resources
  @links = [1]

  jbuilder :resources
end

