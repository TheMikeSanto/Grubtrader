class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.integer :phone
      t.boolean :active, default: true
      t.integer :role_id
      t.integer :organization_id

      t.timestamps
    end
  end
end
