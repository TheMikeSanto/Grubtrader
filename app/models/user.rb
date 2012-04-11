class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :fname, :lname,
                  :phone, :active, :role_id, :organization_id

  validates_presence_of :email, :fname, :lname, :organization_id

  belongs_to :role
  belongs_to :organization
  has_many :donations
  has_many :orders

  def name
  	fname + " " + lname
  end

  def is_admin?
    Role.find(role_id).name == "Admin"
  end
end
