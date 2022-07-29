class RecipesController < ApplicationController

  before_action :authenticate_user!, only: [:new,:edit,:create,:update,:destroy]
  before_action :set_recipe, only: [:show,:eit,:update,:destroy]


  def new
    @recipe = Recipe.new
    @genres = Genre.all
  end

  def create
    recipe = Recipe.new(recipe_params)
    recipe.user_id = current_user.id
    if
      recipe.save
      redirect_to recipes_path, notice: "レシピを登録しました。"
    else
      flash.now[:notice] = "記入の漏れがあります。"
      render 'new'
    end
  end

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def search
    @q = Recipe.ransack(params[:q])
    @recipes = @q.result(distinct: true).page(params[:page]).per(6)
    @search = params[:q][:cuisine_name_or_foodstuffs_name_cont]
# 取得したgenre_id_eqをnameに変換
    @search_genre = Genre.find(params[:q][:genre_id_eq]).name
  end


  def edit
    @genres = Genre.all

  end


  private


  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(
      :user_id,
      :foodstuff_id,
      :cuisine_name,
      :quantity,
      :step_id,
      :memo,
      :image,
      :movie,
      genre_ids: [],
      foodstuffs_attributes:[:id,:name,:amount,:_destroy],
      steps_attributes:[:id,:direction,:_destroy]
    )
  end

end
