class OrderObserver < ActiveRecord::Observer 
	def after_create(order)
		if order.create_inventory
			OrderMailer.order_confirmation(order).deliver

			# Notify donators
			order.order_lines.each do |line|
				donations = Inventory.find_by_order_line_id(line.id).donation_lines
				Rails.logger.info(donations.inspect)
				donations.each do |donation|
					OrderMailer.notify_donor(order, donation).deliver
				end
			end
		end
	end
end