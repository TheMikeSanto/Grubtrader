class OrderObserver < ActiveRecord::Observer 
	def after_create(order)
		# Notify donators
		order.order_lines.each do |line|
			order.create_inventory(line)
			line.reload

			donation = line.inventory.donation_line
			OrderMailer.notify_donor(order, donation).deliver
		end
		OrderMailer.order_confirmation(order).deliver
	end
end