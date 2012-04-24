class OrderMailer < ActionMailer::Base
  default from: "orders@foodbank.com"

  def order_confirmation(order)
  	@user = order.user
  	@order = order
  	mail(to: @user.email, subject: "Order confirmation: order ##{order.id}")
  end
end
