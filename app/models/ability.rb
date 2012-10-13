class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    #for guest
    can :read, :all

    if user.role?('employee')
      can :manage, Task do |task|
        task.received_staff_id == user.id
      end
    end

    if user.role?('administrator')
      can :manage, :all
    end

  end
end
