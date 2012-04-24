module DonationsHelper
	def donation_product_summary(donation, product)
		[donation.total_product_quantity(product).to_s, product.unit.name, product.name.downcase].join(" ")
	end
end
