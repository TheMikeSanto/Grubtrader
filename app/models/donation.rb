class Donation < ActiveRecord::Base
	belongs_to :user
	has_many :donation_lines

	accepts_nested_attributes_for :donation_lines
end
