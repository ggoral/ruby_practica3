require 'bundler'
require 'active_record'
require 'sinatra'
require 'sinatra/activerecord'

Bundler.require :default, ENV['RACK_ENV'].to_sym

Dir[File.dirname(__FILE__) + '/models/*.rb'].each { |ruby_file| require_relative ruby_file }
Dir[File.dirname(__FILE__) + '/helpers/*.rb'].each { |ruby_file| require_relative ruby_file }

before do
  content_type("json")
end

get resources do
    
  @resources = $resources
  @links = [1]

  jbuilder :resources
end