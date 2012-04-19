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

  before_create :set_role_id

  def name
  	fname + " " + lname
  end

  def is_admin?
    role.present? and role.name == "Administrator"
  end

  def is_producer?
    organization.present? and organization.organization_role.name == "Producer"
  end

  def is_distributor?
    organization.present? and organization.organization_role.name == "Distributor"
  end

  def set_role_id
    if self.organization.users == 0
      self.role_id = Role.admin_role_id
    else
      self.role_id = Role.user_role_id
    end
  end
end
