Bundler.require
require_relative 'customer'
require_relative 'order'
require_relative 'supplier'
require_relative 'account'

ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: 'db/test.sqlite3'
