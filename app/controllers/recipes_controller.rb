class RecipesController < ApplicationController

  before_action :authenticate_user!, only: [:new,:edit,:create,:update,:destroy]
  before_action :set_recipe, only: [:show,:edit,:update,:destroy]


  def new
    @recipe = Recipe.new
    @genres = Genre.all
    @nutritions = Nutrition.all
  end

  def create
    recipe = Recipe.new(recipe_params)
    recipe.user_id = current_user.id
    if recipe.save
      redirect_to recipes_path, notice: "レシピを登録しました。"
    else
      flash.now[:notice] = "記入の漏れがあります。"
      redirect_back fallback_location: recipes_path
    end
  end

  def index
    @recipes = Recipe.all
  end

  def show
    @title = "#{@recipe.cusine_name}の詳細"
  end

  def search
    @q = Recipe.ransack(params[:q])
    @recipes = @q.result(distinct: true).page(params[:page]).per(6)
    @search = params[:q][:cuisine_name_or_nutritions_name_cont]
# 取得したgenre_id_eqをnameに変換
    @search_genre = Genre.find(params[:q][:genre_id_eq]).name
  end


  def edit
    @title = "#{@recipe.cusine_name}の編集"
    @genres = Genre.all
    if @recipe.user == current_user
      render "edit"
    else
      redirect_back fallback_location: root_path, flash: { alert: "他人のレシピは編集できません" }
    end
  end

  def update
    @recipe.update(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe), flash: { notice: "「#{@recipe.cusine_name}」のレシピを更新しました。" }
    else
      flash.now[:notice] = "記入の漏れがあります。"
      redirect_back fallback_location: recipe_path(@recipe)
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path, flash: { notice: "「#{@recipe.cusine_name}」のレシピを削除しました。" }
  end


  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(
      :user_id,
      :cuisine_name,
      :quantity,
      :memo,
      :image,
      :movie,
      :genre_id,
      foodstuffs_attributes:[:id,:name,:amount,:_destroy],
      steps_attributes:[:id,:direction,:_destroy]
    )
  end

end
