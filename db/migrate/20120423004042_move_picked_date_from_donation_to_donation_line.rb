class MovePickedDateFromDonationToDonationLine < ActiveRecord::Migration
  def up
  	remove_column :donations, :date
  	add_column :donation_lines, :picked_date, :datetime
  end

  def down
  	remove_column :donation_lines, :picked_date
  	add_column :donations, :date, :datetime
  end
end
