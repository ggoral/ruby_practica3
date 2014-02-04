# 20140204095057_create_customer.rb
class CreateCustomer < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string :name
      t.string :description
 
      t.timestamps
    end
  end
 
  def self.down
    drop_table :customers
  end
end

