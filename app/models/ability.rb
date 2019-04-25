class Ability
  include CanCan::Ability

def initialize(user)
    return unless user && user.emp_role == 'Admin'
    can :read, :all                 # allow everyone to read everything
    can :manage, :all             # allow superadmins to do anything
    #can :access, :rails_admin       # only allow admin users to access Rails Admin
    #can :read, :dashboard           # allow access to dashboard
    if user.emp_role == 'Manager'
      can :read, :all                 # allow everyone to read everything
      can :manage, Shift, user_id: user.id             
    elsif user.emp_role == 'Employee'
      can :read, Store 
      can :read, Employee
      can :read, [Employee, Assignment, Shift, ShiftJob], user_id: user.id
      can :update, [Employee, User], user_id: user.id
    else
      can :read, Stores, inactive: false
    end
end
  #def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  #end
end
