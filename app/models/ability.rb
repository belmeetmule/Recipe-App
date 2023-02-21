class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    return unless user.present?

    can(:manage, Food, user:)
    can(:manage, Recipe, user:)
    can :manage, RecipeFood do |food_ingredient|
      food_ingredient.recipe.user == user
    end
    can :read, :all

    return unless user.admin?

    can :manage, :all
  end
end
