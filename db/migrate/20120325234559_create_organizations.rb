class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :state
      t.string :city
      t.string :street
      t.string :zip
      t.integer :phone
      t.string :email
      t.integer :role_id

      t.timestamps
    end
  end
end
