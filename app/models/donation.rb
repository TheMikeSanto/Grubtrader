class Donation < ActiveRecord::Base
	belongs_to :user
	has_many :donation_lines, dependent: :destroy

	accepts_nested_attributes_for :donation_lines
end
