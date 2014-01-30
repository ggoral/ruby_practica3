Bundler.require
require_relative 'transaction'

ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: '/tmp/transaction.db'

puts "All transaction names"
Transaction.all.each do |transaction|
  p transaction.name
end

puts "Add a Personal transaction"
t = Transaction.new
t.name = "personal"
t.save

puts "All transaction ids"
Transaction.all.each do |transaction|
  p transaction
end

last_personal_transaction = Transaction.where(name: "personal").order('id desc').first
p last_personal_transaction

low_id_transactions = Transaction.where( " id < 3 ")
p low_id_transactions

puts Transaction.create(name: "aAdapter").valid?
puts Transaction.create(name: nil).valid?
