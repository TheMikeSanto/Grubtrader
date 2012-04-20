class CreateProductCategories < ActiveRecord::Migration
  def up
  	create_table :product_categories do |t|
  		t.string :name

  		t.timestamps
		end
  end

  def down
  	drop_table :product_categories
  end
end
