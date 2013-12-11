require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym

helpers do
  def edit_resource_url(resource)
    "http://example.com/resources/#{resource.id}/edit"
  end
end

get '/' do
  @resource = Hashie::Mash.new(id: 1, name: "Computadora", description:"Notebook Thinkpad")
  
  jbuilder :example
end

get '/resourses' do
  erb :index
end
