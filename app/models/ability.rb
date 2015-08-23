class Ability
  include CanCan::Ability

  def initialize(customer)
    customer ||= Customer.new # guest user (not logged in)

    alias_action :create, :read, :update, :destroy, :to => :crud

      if customer.admin?
        can :manage, :all
        can :access, :rails_admin #grant access to rails_admin
        can :dashboard
      else
        can :read, Product, :active => true
        can :create, Product
        can :crud, Customer, :customer_id => customer.id
      end
  end
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
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
end
