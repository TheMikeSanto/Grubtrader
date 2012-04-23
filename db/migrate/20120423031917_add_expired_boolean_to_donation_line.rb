class AddExpiredBooleanToDonationLine < ActiveRecord::Migration
  def change
  	add_column :donation_lines, :expired, :boolean, default: false
  end
end
