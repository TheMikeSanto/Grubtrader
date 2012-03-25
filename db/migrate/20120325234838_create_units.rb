class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.name :string

      t.timestamps
    end
  end
end
