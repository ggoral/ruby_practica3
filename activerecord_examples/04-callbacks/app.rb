Bundler.require
require_relative 'transaction'

ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: '/tmp/transaction.db'

