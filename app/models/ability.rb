class Ability
  include CanCan::Ability

  def initialize( user ) 
    user ||= User.new                          # guest user 

    if user.role? :admin 
      can :manage, :all 
    elsif user.role? :diretor
      can :manage, Caso
      can :manage, Cliente
      can :manage, User
      can :manage, Estagiario
    elsif user.role? :estagiário
      can :manage, Caso
      can :manage, Cliente
      can :edit,   Estagiario
    elsif user.role? :calouro
      can :manage, Cliente
      can :manage, Caso
      can :edit,   Calouro
    elsif user.role? :vareiro
      can :edit, Vareiro
    end 
  end 
end
