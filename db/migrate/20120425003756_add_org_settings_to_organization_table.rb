class AddOrgSettingsToOrganizationTable < ActiveRecord::Migration
  def change
  	add_column :organizations, :settings, :text
  end
end
