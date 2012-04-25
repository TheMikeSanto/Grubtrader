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

  def is_org_admin?
    return false unless organization.present?
    organization.settings.present? and organization.settings[:org_admin_ids].present? and organization.settings[:org_admin_ids].include?(id)
  end

  def is_producer?
    organization.present? and organization.role.name == "Producer"
  end

  def is_distributor?
    organization.present? and organization.role.name == "Distributor"
  end

  def supply_role
    return nil unless organization.present?
    organization.role.name
  end
  
  def set_role_id
    self.role_id = Role.user_role_id
  end
end
