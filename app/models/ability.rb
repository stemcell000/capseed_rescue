class Ability
  include CanCan::Ability

  def initialize(user)  
    alias_action :create, :read, :update, :destroy, to: :crud
    alias_action :read, :update, to: :ru
    alias_action :create, :read, :update, to: :cru
    user ||= User.new # guest user (not logged in)
    if user.role? :superadmin
        can :manage, :all
    elsif user.role? :administrator
        can :cru, :all
    elsif user.role? :user
        can :ru, Production
        can :ru, Assay
        can :ru, Clone
        can :manage, Sequencing
        can :manage, Box
        can :manage, PlasmidBox
        can :manage, Clone_batch
        can :manage, Pcr_colony
        can :manage, Plasmid_batch
        can :manage, Plasmid_batch_qc
        can [:edit, :update, :update_password], User, :id => user.id
        cannot :update_row_order, Assay
        cannot :update_row_order, Production
        cannot :destroy, VirusProduction
        cannot :destroy, Clone
        cannot :destroy, CloneBatch
        cannot :create, User
        cannot :destroy, User
    else
        can :read, :all
    end
  end
end
