class RecreateInventories < ActiveRecord::Migration
	def change
		create_table :inventories do |t|
			t.integer :order_line_id
			t.integer :donation_line_id

			t.timestamps
		end
	end
end
