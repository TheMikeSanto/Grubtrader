class Order < ActiveRecord::Base
	belongs_to :user
	has_one :organization, through: :user
	has_many :order_lines, dependent: :destroy

	accepts_nested_attributes_for :order_lines

	after_create :create_inventory

	def filled?
		filled = true
		order_lines.each do |line|
			unless line.filled?
				filled = false
			end
		end
		filled
	end

	def involved_organization_ids
		ids = []
		order_lines.each do |line|
			ids << line.donation_line.donation.organization.id
		end
		ids.uniq
	end

	def create_inventory
		order_lines.each do |line|
			donations = DonationLine.available.where(product_id: line.product_id)
			donations.each do |donation|
				unless donation.expired?
					if donation.quantity > line.quantity_requested
						inventory = Inventory.create(order_line_id: line.id)
						# Create a donation line with the left over products that the order
						# didn't take
						left_over = DonationLine.create(donation_id: donation.donation_id,
																product_id: donation.product_id,
																picked_date: donation.picked_date.to_s,
																quantity: donation.quantity - line.quantity_requested)

						taken 		= DonationLine.create(donation_id: donation.donation_id,
																product_id: donation.product_id,
																picked_date: donation.picked_date.to_s,
																quantity: line.quantity_requested,
																inventory_id: inventory.id)

						line.update_attributes(quantity_filled: line.quantity_requested)
						donation.destroy # destroy original since we have two others that represent it
					elsif donation.quantity < line.quantity_requested
						# Create an order line to take all quantity of that donation line
						# and create another order line for the leftover
						taken = OrderLine.create(order_id: line.order_id, 
															quantity_requested: donation.quantity,
															quantity_filled: donation.quantity,
															product_id: line.product_id)

						difference = line.quantity_requested - donation.quantity
						still_needed = OrderLine.create(order_id: line.order_id,
																			quantity_requested: difference,
																			product_id: line.product_id)

						inventory = Inventory.create(order_line_id: taken.id)
						donation.update_attributes(inventory_id: inventory.id)
						line.destroy #destroy original since we have two others that represent it 
					elsif donation.quantity == line.quantity_requested
						inventory = Inventory.create(order_line_id: line.id)
						donation.update_attributes(inventory_id: inventory.id)
						line.update_attributes(quantity_filled: line.quantity_requested)
					end
				end
			end
		end
	end
end
