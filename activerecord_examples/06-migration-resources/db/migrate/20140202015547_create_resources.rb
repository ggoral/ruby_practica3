# 20140202015547_my_migration.rb
class CreateResources < ActiveRecord::Migration
  def self.up
    create_table :resources do |t|
      t.string :name
      t.string :description
 
      t.timestamps
    end
  end
 
  def self.down
    drop_table :resources
  end
end

