require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym

helpers do
  def edit_resource_url(resource)
    "http://example.com/resources/#{resource.id}/edit"
  end
end

get '/resources/1' do
  @resource = Hashie::Mash.new(id: 1,
                               name: "Computadora",
                               description:"Notebook con 4GB de RAM y 256 GB de espacio en disco con Linux")

  @resource.links = [Hashie::Mash.new(id:1 , 
                                      rel: "self",
                                      uri: "http://localhost:9292/resources/1")]

  jbuilder :resource
end

get '/resources' do
  @resource = Hashie::Mash.new(id: 1,
                               name: "Computadora",
                               description:"Notebook con 4GB de RAM y 256 GB de espacio en disco con Linux")

  @resource.links = [Hashie::Mash.new(id:1 , 
                                      rel: "self",
                                      uri: "http://localhost:9292/resources/1")]
  @resources = [@resource]
  @links = [1]

  jbuilder :resources
end
