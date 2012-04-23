class CreateOrderLines < ActiveRecord::Migration
  def change
    create_table :order_lines do |t|
      t.integer :order_id
      t.integer :inventory_id
      t.integer :quantity_filled, default: 0
      t.integer :quantity_requested

      t.timestamps
    end
  end
end
