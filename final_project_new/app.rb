require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym

#Dir['./app/controllers/*.rb'].sort.each { |req| require_relative req }



get '/' do
  'Hello World'
end
