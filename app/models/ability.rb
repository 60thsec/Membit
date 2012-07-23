class Ability
  include CanCan::Ability

  def initialize(user)
    return if user.nil?

    if user.role.participant? || user.role.tester?
      can :create, UserWord
      can :withdraw, User
      can :read, :dashboard
    elsif user.role.admin?
      can :read, :all
      can :manage, :all
      cannot :withdraw, User
    elsif user.role.teacher?
      can :read, :statistics
    end
  end
end