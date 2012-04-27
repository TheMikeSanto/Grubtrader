class Organization < ActiveRecord::Base
	has_many :users
	belongs_to :organization_role, foreign_key: :role_id

	validates_presence_of :phone, :state, :city, :street, :zip, :email, :name, :role_id
	validates :phone, phone_number_legit: true
	validates :zip, zip_code_legit: true

	serialize :settings

	def role
		organization_role
	end

	def admins
		User.where(id: settings[:org_admin_ids])
	end
	
	def address
		street + " " + city + ", " + state + " " + zip
	end

	def is_producer?
		role.name == "Producer"
	end

	def is_distributor?
		role.name == "Distributor"
	end

	def transaction_count
		if is_producer?
			transactions = users.map{ |user| user.donations }
		elsif is_distributor?
			transactions = users.map{ |user| user.orders }
		end

		count = 0
		transactions.each do |t|
			count += t.length
		end
		count
	end
end
