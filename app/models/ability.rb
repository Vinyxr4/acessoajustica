class Ability
  include CanCan::Ability

  def initialize( user ) 
    user ||= User.new                          # guest user 

    if user.role? :admin 
      can :manage, :all 
    elsif user.role? :diretor
      can :manage, :all
    elsif user.role? :estagiário
      cannot :manage, :all
      can :manage, Caso
      can :manage, Cliente
    elsif user.role? :calouro
      can :manage, Cliente
    end 
  end 
end
