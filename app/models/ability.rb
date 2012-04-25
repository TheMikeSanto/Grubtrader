class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest

    can [:create, :new], Organization


    can [:read, :view], Organization
    can :read, User
    can :update, User, id: user.id

    can :read, OrganizationRole
    can :read, Role
    can :read, Unit

    if user.is_producer?
      can :create, Donation
      can :manage, Donation, user: {organization_id: user.organization_id }
      cannot :create, Organization
      cannot :create, User
    end

    if user.is_distributor?
      can :create, Order
      can :manage, Order, user: {organization_id: user.organization_id}
      can :view, Donation
      can :manage, Report
      can :view, :inventory
      can :view, Product
      can :view, User
      cannot :create, Organization
      cannot :create, User
    end

    if user.is_org_admin?
      can :update, Organization, id: user.organization_id
      can :update, User, organization_id: user.organization_id
      can :view,   User
    end

    if user.is_org_admin? && user.is_distributor?
      can [:create, :update], Product
    end

    if user.is_admin?
      can :manage, :all
    end

    cannot [:update, :destroy, :create], Role
    cannot [:update, :destroy, :create], OrganizationRole
    cannot :destroy, :all
  end
end
