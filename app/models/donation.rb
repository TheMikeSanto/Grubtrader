class Donation < ActiveRecord::Base
	belongs_to :user
	has_one :organization, through: :user
	has_many :donation_lines, dependent: :destroy

	accepts_nested_attributes_for :donation_lines

	def expired?
		expired = true
		donation_lines.each do |line|
			# Check for the existence of a non-expired donation line
			# if the donation header still has non-expired lines, it is not expired
			if DateTime.now < line.expires_at
				expired = false
			end
		end
		expired
	end
end
