class Order < ActiveRecord::Base
	belongs_to :user
	has_many :order_lines

	accepts_nested_attributes_for :order_lines
end
