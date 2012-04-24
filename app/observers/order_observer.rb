class OrderObserver < ActiveRecord::Observer 
	def after_create(order)
		order.create_inventory
		OrderMailer.order_confirmation(order).deliver
	end
end