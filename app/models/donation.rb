class Donation < ActiveRecord::Base
	belongs_to :user
	has_many :donation_lines
end
