class Inventory < ActiveRecord::Base
	belongs_to :order_line
	has_many :donation_lines
	has_one :donation, through: :donation_line
	has_one :order, through: :order_line
end