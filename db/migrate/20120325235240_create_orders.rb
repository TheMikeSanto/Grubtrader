class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :request_date
      t.date :filled_date
      t.integer :user_id

      t.timestamps
    end
  end
end
