class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    recipe = Recipe.new(recipe_params)
    recipe.user_id = current_user.id
    recipe.save
    redirect_to recipes_path
  end

  def index
  end

  def show
  end

  def edit
  end

  private

  def recipe_params
    params.require(:recipe).permit(
      :user_id,
      :foodstuff_id,
      :genre_id,
      :cuisine_name,
      :quantity,
      :step_id,
      :memo,
      foodstuffs_attributes:[:id,:name,:amount,:_destroy],
      steps_attributes:[:id,:direction,:_destroy]
    )
  end

end
