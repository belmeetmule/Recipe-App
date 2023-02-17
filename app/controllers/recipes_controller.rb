class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    @user = current_user
    @recipe = @user.recipes.new(recipes_params)
    @recipe.public = false
    if @recipe.save
      redirect_to recipes_path, notice: 'recipe was successfully created'
    else
      render :new, alert: "Couldn't create recipe for user"
    end
  end

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @foods = Food.all
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path, notice: 'Recipe was deleted successfully'
  end

  private

  def recipes_params
    params.permit(:name, :description, :preparation_time, :cooking_time, current_user.id)
  end
end