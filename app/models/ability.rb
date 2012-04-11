class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest

    can :create, User
    can [:read, :update], User, id: user.id

    if user.is_producer?
      can :manage, Donation, organization_id: user.organization_id
    end

    if user.is_distributor?
      can :manage, Order, organization_id: user.organization_id
    end

    if user.is_admin?
      can :manage, :all
    end
  end
end
