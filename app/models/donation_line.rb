class DonationLine < ActiveRecord::Base
	belongs_to :donation
	belongs_to :product
end
