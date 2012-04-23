class DonationLine < ActiveRecord::Base
	belongs_to :donation
	belongs_to :product

	before_validation :convert_date_to_datetime

	def convert_date_to_datetime
		picked_date = DateTime.parse(picked_date_before_type_cast)
	end
end
