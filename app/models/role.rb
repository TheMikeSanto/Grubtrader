class Role < ActiveRecord::Base
	has_many :users

	def self.admin_role_id
		Role.find_by_name("Admin").id
	end

	def self.user_role_id
		Role.find_by_name("User").id
	end
end
