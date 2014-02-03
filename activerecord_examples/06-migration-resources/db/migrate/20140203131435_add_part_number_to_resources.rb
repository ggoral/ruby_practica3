# 20140203131435_Add_PartNumber_to_resources.rb
class AddPartNumberToResources < ActiveRecord::Migration
  def change
    add_column :resources, :part_number, :string
  end
end

