class AdminAbility
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    #for guest
    can :read, :all

    #for administrator
    if user.role?('administrator')
      can :manage, :all
    end

  end
end
