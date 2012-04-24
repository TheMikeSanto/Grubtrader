class OrderMailer < ActionMailer::Base
  default from: "orders@foodbank.com"

  def order_confirmation(order)
  	@user = order.user
  	@order = order
  	mail(to: @user.email, subject: "Order confirmation: order ##{order.id}")
  end

  def notify_donor(order, donation_line)
  	@donation_line = donation_line
  	@donation = donation_line.donation
  	@donor = @donation.user
  	@order = order
  	mail(to: @donor.email, subject: "An item you donated needs pickup - Donation ##{@donation.id})")
	end

end
