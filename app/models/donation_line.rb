class DonationLine < ActiveRecord::Base
	belongs_to :donation
	belongs_to :product
	has_one :unit, through: :product
	scope :available, conditions: {inventory_id: nil}

	default_scope order('created_at ASC')
	
	if Rails.env != "test"
		before_validation :convert_date_to_datetime
	end

	scope :expired, conditions: ["expired = ?", true]
	scope :unexpired, conditions: ["expired = ?", false]

	def convert_date_to_datetime
		picked_date = DateTime.parse(picked_date_before_type_cast)
	end

	def expires_at
		span = product.shelf_life_span
		time = product.shelf_life_time

		case span
		when 'days'
			expires_at = picked_date + time.days
		when 'weeks'
			expires_at = picked_date + time.weeks
		when 'months'
			expires_at = picked_date + time.months
		else
			epires_at = nil
		end

		expires_at
	end

	def expired?
		DateTime.now > expires_at
	end
end
