Bundler.require
require_relative 'customer'
require_relative 'order'

ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: 'db/test.sqlite3'
