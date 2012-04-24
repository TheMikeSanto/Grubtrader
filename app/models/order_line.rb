class OrderLine < ActiveRecord::Base
	belongs_to :order
	belongs_to :product
	has_one :unit, through: :product

	def filled?
		quantity_filled == quantity_requested
	end
end
