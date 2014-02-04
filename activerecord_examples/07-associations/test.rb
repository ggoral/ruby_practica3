Bundler.require
require_relative 'transaction'

ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: '/tmp/transaction.db'

#puts "Add a Personal transaction"
#customer = Customer.new
#customer.name = "aCustomer"
#customer.save

#puts "All customer names"
#Customer.all.each do |customer|
#  p customer.name
#end
