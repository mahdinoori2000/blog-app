# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= current_user

    if user.role == "admin"
      can :manage, :all
    else
      can :read, :all
      can :create, [Post, Comment]
      can :update, [Post, Comment], user_id: user.id
      can :destroy, Post, user_id: user.id
      can :destroy, Comment, user_id: user.id
    end
  end
end
