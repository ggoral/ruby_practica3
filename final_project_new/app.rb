require 'bundler'
require 'active_record'
require 'sinatra'
require 'sinatra/activerecord'

Bundler.require :default, ENV['RACK_ENV'].to_sym

# Require MVC
Dir[File.dirname(__FILE__) + '/models/*.rb'].each { |ruby_file| require_relative ruby_file }

# Preguntar porque no anda el enviroment.rb
# Dir[File.dirname(__FILE__) + '/config/*.rb'].each {|ruby_file| require_relative ruby_file }

# hash = YAML.load(File.new(root + '/config/database.yml'))[environment]
# ActiveRecord::Base.establish_connection(hash)
# ActiveRecord::Base.connection
# ActiveRecord::Base.include_root_in_json = false

get '/' do
  'Hello World'
end
