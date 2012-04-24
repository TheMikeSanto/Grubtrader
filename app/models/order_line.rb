class OrderLine < ActiveRecord::Base
	belongs_to :order
	belongs_to :product
	has_one :unit, through: :product

	def filled?
		quantity_filled == quantity_requested
	end

	def donation_line
		Inventory.find_by_order_line_id(id).donation_lines.first
	end
end
