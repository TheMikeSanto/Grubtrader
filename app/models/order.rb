class Order < ActiveRecord::Base
	belongs_to :user
	has_one :organization, through: :user
	has_many :order_lines, dependent: :destroy

	accepts_nested_attributes_for :order_lines
end
