class OrderLine < ActiveRecord::Base
	belongs_to :order
	belongs_to :product
	has_one :unit, through: :product
end
