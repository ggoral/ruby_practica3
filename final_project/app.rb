require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym

helpers do
  def edit_resource_url(resource)
    "http://example.com/resources/#{resource.id}/edit"
  end
end

get '/resources/1' do
  #@resource = Hashie::Mash.new()
  #@resource.resource = Hashie::Mash.new(id: 1, name: "Computadora", description:"Notebook Thinkpad")
  @resource = Hashie::Mash.new(id: 1, name: "Computadora", description:"Notebook Thinkpad")
  @resource.links = Array.new(1) { |i| Hashie::Mash.new(id: i+1, name: "@ikm", content: "My missing book...") }
  jbuilder :resource
end

get '/resourses' do
  erb :index
end
