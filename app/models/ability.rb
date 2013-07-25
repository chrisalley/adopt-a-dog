class Ability  
  include CanCan::Ability  
  
  def initialize(user) 
    user ||= User.new # Creates guest user if not logged in.
    if user.role? :administrator
      can :manage, :all
    else
      can :create, User
      can :create, Message
      can :read, Dog, :adopted => false
      can :read, HappyTail
      can :read, NewsEntry
      can :read, Page
      can :read, Question
    end
  end
end