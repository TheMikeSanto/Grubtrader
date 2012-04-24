class Organization < ActiveRecord::Base
	has_many :users
	belongs_to :organization_role, foreign_key: :role_id

	validates_presence_of :phone, :state, :city, :street, :zip, :email, :name, :role_id

	def role
		organization_role
	end

	def address
		street + " " + city + ", " + state + " " + zip
	end
end
