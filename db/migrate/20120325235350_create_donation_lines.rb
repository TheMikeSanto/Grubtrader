class CreateDonationLines < ActiveRecord::Migration
  def change
    create_table :donation_lines do |t|
      t.integer :inventory_id
      t.integer :donation_id
      t.integer :quantity

      t.timestamps
    end
  end
end
