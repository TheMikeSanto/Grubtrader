class ChangeInventoryIdToProductIdOnOrderLine < ActiveRecord::Migration
  def up
  	remove_column :order_lines, :inventory_id
  	add_column :order_lines, :product_id, :integer
  end

  def down
  	remove_column :order_lines, :product_id
  	add_column :order_lines, :inventory_id, :integer
  end
end
