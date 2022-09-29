class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post, published: true

    return unless user.present?

    can :manage, Post, author: user
    can :manage, Comment, author: user
    can :manage, Like, author: user

    return unless user.role == 'admin'

    can :manage, :all
  end
end
