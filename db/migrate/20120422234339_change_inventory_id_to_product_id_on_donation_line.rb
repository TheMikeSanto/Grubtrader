class ChangeInventoryIdToProductIdOnDonationLine < ActiveRecord::Migration
  def up
  	remove_column :donation_lines, :inventory_id
  	add_column :donation_lines, :product_id, :integer
  end

  def down
  	remove_column :donation_lines, :product_id
  	add_column :donation_lines, :inventory_id, :integer
  end
end
