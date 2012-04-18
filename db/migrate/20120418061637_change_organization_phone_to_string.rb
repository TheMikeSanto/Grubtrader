class ChangeOrganizationPhoneToString < ActiveRecord::Migration
  def up
    remove_column :organizations, :phone
    add_column    :organizations, :phone, :string
  end

  def down
    remove_column :organizations, :phone
    add_column    :organizations, :phone, :integer
  end
end
