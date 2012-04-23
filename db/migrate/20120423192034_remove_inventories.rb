class RemoveInventories < ActiveRecord::Migration
  def up
  	drop_table :inventories
  end

  def down
  end
end
