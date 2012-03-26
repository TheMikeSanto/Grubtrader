class Inventory < ActiveRecord::Base
	belongs_to :product
	has_many :donation_lines
	has_many :order_lines
end
