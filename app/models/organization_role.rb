class OrganizationRole < ActiveRecord::Base
	has_many :organizations

	def self.producer_role_id
		OrganizationRole.find_by_name("Producer").id
	end

	def self.distributor_role_id
		OrganizationRole.find_by_name("Distributor").id
	end
end
