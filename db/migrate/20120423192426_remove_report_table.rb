class RemoveReportTable < ActiveRecord::Migration
  def up
  	drop_table :reports
  end

  def down
  end
end
