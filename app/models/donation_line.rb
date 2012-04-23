class DonationLine < ActiveRecord::Base
	belongs_to :donation
	belongs_to :product

	before_save :convert_date_to_datetime

	def convert_date_to_datetime
		date = DateTime.new(date)
	end
end
