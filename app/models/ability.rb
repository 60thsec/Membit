class Ability
  include CanCan::Ability

  def initialize(user)
    return if user.nil?

    # All users
    can :edit, :self

    if user.role.participant? || user.role.tester?
      can :create, UserWord
      can :withdraw, :self
      can :read, :dashboard
      can :review, UserWord
    elsif user.role.admin?
      can :read, :all
      can :manage, :all
      can :withdraw, User
      cannot :withdraw, :self
    elsif user.role.teacher?
      can :read, :statistics
      can :read, :dashboard
      can :review, UserWord
      can :create, UserWord
    end
  end
end
