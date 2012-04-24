class AddInventoryIdToDonationLine < ActiveRecord::Migration
  def change
  	add_column :donation_lines, :inventory_id, :integer
  end
end
