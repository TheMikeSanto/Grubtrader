class RemoveExtraDatesFromOrder < ActiveRecord::Migration
  def up
  	remove_column :orders, :filled_date
  	remove_column :orders, :request_date
  end

  def down
  	add_column :orders, :filled_date, :date 
  	add_column :orders, :request_date, :date
  end
end
