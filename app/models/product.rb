class Product < ActiveRecord::Base
	has_many :inventories
	belongs_to :product_category
	belongs_to :unit

	def full_shelf_life
		shelf_life_time.to_s + " " + shelf_life_span
	end

	def inventory
		inventory = 0
		DonationLine.unexpired.where(product_id: id).map { |line| inventory += line.quantity}
		inventory
	end
end
