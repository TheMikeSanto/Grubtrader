class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :shelf_life
      t.string :name
      t.integer :product_category_id
      t.integer :unit_id

      t.timestamps
    end
  end
end
