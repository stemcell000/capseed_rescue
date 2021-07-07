class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.role? :administrator
        can :manage, :all
    elsif user.role? :user
        can :create, :production
        can :update, :production
        can :update, :assay
        can :update, :clone
        can :manage, :clone_attachment
        can :manage, :clone_batch_attachment
        can :manage, :sequencing
        can :manage, :box
        can :manage, :plasmid_box
        can :manage, :clone_batch
        can :manage, :pcr_colony
        can :manage, :qc_attachment
        can :manage, :clone_batch_as_plasmid_attchment
        can :manage, :plasmid_batch
        can :manage, :plasmid_batch_attachment
        can :manage, :plasmid_batch_qc
        can :manage, :plasmid_batch_qc_attachment
        can [:edit, :update, :update_password], User, :id => user.id
        cannot :update_row_order, :assay
        cannot :update_row_order, :production
        cannot :destroy, :virus_production
        cannot :destroy, :clone
        cannot :destroy, :clone_batch
        cannot :create, :user
        cannot :destroy, :user
    else
        can :read, :all
    end
  end
end
