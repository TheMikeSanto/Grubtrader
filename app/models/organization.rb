class Organization < ActiveRecord::Base
	has_many :users
	belongs_to :organization_role
end
