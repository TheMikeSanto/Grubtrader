class Organization < ActiveRecord::Base
	has_many :users
	belongs_to :organization_role, foreign_key: :role_id
end
