class OrderLine < ActiveRecord::Base
	belongs_to :order
	belongs_to :product
	has_one :unit, through: :product
	has_one :inventory

	def filled?
		quantity_filled == quantity_requested
	end

	def donation_line
		inventory.donation_line
	end
end
