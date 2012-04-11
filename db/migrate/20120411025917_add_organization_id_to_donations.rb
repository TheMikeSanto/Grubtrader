class AddOrganizationIdToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :organization_id, :integer
  end
end
