class Product < ActiveRecord::Base
	belongs_to :product_category
	belongs_to :unit

	def full_shelf_life
		shelf_life_time.to_s + " " + shelf_life_span
	end

	# Returns the number of non-expired donations available
	def available
		available = 0
		DonationLine.unexpired.where(product_id: id).where(inventory_id: nil).map { |line| available += line.quantity}
		available
	end

	def on_hand
		on_hand = 0
		DonationLine.unexpired.where(product_id: id).where("inventory_id IS NOT NULL").map { |line| on_hand += line.quantity }
		on_hand
	end

	def in_stock?
		available > 0
	end

	def self.in_stock_count
		count = 0
		Product.scoped.each do |p|
			count += 1 if p.in_stock?
		end
		count
	end
end
