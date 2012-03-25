class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.date :picked_date
      t.integer :on_hand
      t.integer :product_id

      t.timestamps
    end
  end
end
