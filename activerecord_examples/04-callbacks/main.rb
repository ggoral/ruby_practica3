Bundler.require
require_relative 'transaction'

ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: '/tmp/transaction.db'

Transaction.all.each do |transaction|
  p transaction.name
end

#puts "Agregando Personal"
#transaction = Transaction.create(name: "personal")
#
#puts "Agregando DirecTV"
#transaction = Transaction.new
#transaction.name = "directv"
#transaction.save
#
#puts "Agregando Edenor"
#transaction = Transaction.new do |t|
#    t.name = "edenor"
#    t.save
#end
#
#Transaction.all.each do |transaction|
#  p transaction.name
#end

transaction = Transaction.first
puts transaction.name

transactions = Transaction.where(name: "directv")
transactions.each do |transaction|
  p transaction.name
end

transaction = Transaction.find_by(name: 'directv')
if transaction 
  transaction.update(name: 'dtv')
end

transaction = Transaction.find_by(name: 'dtv')
if transaction 
  transaction.destroy
end



