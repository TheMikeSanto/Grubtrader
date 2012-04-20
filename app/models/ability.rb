class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest

    can :create, User
    can [:read, :update], User, id: user.id

    can [:create, :read], Organization

    if user.is_producer?
      can :manage, Donation, organization_id: user.organization_id
    end

    if user.is_distributor?
      can :manage, Order, organization_id: user.organization_id
      can :view, Donation
      can :manage, Report
      can :manage, Inventory
      can :view, Product
      can :update, Organization, organization_id: user.organization_id
    end

    if user.is_admin?
      can :manage, :all
      cannot [:update, :destroy, :create], Role
      cannot [:update, :destroy, :create], OrganizationRole
    end
  end
end
