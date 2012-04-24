class Donation < ActiveRecord::Base
	belongs_to :user
	has_one :organization, through: :user
	has_many :donation_lines, dependent: :destroy

	accepts_nested_attributes_for :donation_lines

	default_scope order('created_at ASC')

	def products
		product_ids = donation_lines.map{ |line| line.product_id }.uniq
		Product.where(id: product_ids)
	end

	def total_product_quantity(product)
		product_quantity = 0
		donation_lines.where(product_id: product.id).each do |line|
			product_quantity += line.quantity
		end
		product_quantity
	end

	def expired?
		expired = true
		donation_lines.each do |line|
			# Check for the existence of a non-expired donation line
			# if the donation header still has non-expired lines, it is not expired
			if DateTime.now < line.expires_at
				expired = false
			end
		end
		expired
	end
end
