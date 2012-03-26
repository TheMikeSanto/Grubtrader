class DonationLine < ActiveRecord::Base
	belongs_to :donation
	belongs_to :inventory
end
