class Product < ActiveRecord::Base
	has_many :inventories
	belongs_to :product_category
	belongs_to :unit
end
