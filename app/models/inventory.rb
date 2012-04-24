class Inventory < ActiveRecord::Base
	has_one :order_line
	has_many :donation_lines
	has_one :order, through: :order_line
	has_one :donation, through: :donation_line
end