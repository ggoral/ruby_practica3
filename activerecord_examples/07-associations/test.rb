Bundler.require
require_relative 'order'
require_relative 'customer'

ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: 'db/test.sqlite3'

#puts "Add a Personal transaction"
#customer = Customer.new
#customer.name = "aCustomer"
#customer.save

#puts "All customer names"
#Customer.all.each do |customer|
#  p customer.name
#end

#puts "Delete all customers"
#Customer.all.each do |customer|
#  customer.destroy
#end

#puts "Add a Order"
#order = Order.create(customer_id: 1, order_date: Time.now)
