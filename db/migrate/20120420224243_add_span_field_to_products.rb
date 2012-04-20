class AddSpanFieldToProducts < ActiveRecord::Migration
  def change
  	remove_column :products, :shelf_life
  	add_column 		:products, :shelf_life_time, :integer
  	add_column 		:products, :shelf_life_span, :string
  end
end
