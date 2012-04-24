class OrderObserver < ActiveRecord::Observer 
	def after_create(order)
		order.create_inventory
		OrderMailer.order_confirmation(order).deliver

		# Notify donators
		order.order_lines.each do |line|
			donations = Inventory.find_by_order_line_id(line.id).donation_lines
			donations.each do |donation|
				OrderMailer.notify_donator(order, donation)
			end
		end
	end
end