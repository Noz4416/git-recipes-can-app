class RecipesController < ApplicationController

  before_action :authenticate_user!, only: [:new,:edit,:create,:update,:destroy]
  before_action :set_recipe, only: [:show,:edit,:update,:destroy]

  def new
    @recipe = Recipe.new
    @genres = Genre.all
    @materials = Material.all
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    # GoogleCloudVisionAPI用の記述
    # if recipe_params[:image]
    #   Vision.get_image_data(recipe_params[:image]) # or params[:recipe][:image]
    #   @recipe.save
    #   count = params[:recipe][:material_count].to_i
    #   Ingredient.order('id DESC').limit(count).each do |ing|
    #     material = Material.find_by(name: ing.name)
    #     ing.update(material_id: material.id)
    #   end
    #   redirect_to edit_recipe_path(@recipe)
    if @recipe.save
      count = params[:recipe][:material_count].to_i
      Ingredient.order('id DESC').limit(count).each do |ing|
        material = Material.find_by(name: ing.name)
        if material
          ing.update!(material_id: material.id)
        end
      end
      redirect_to recipes_path, notice: "レシピを登録しました。"
    else
      flash.now[:notice] = "記入の漏れがあります。"
      @materials = Material.all
      render :new
    end
  end

  def index
    if user_signed_in?
      @recipes = Recipe.includes([:user],[:bookmarks]).where(user_id: current_user.id).order(created_at: :desc)
    else
      @recipes = Recipe.all
    end
  end

  def show
    @title = "#{@recipe.cuisine_name}"
    @calorie = @recipe.calculate(:calorie, @recipe).floor(0)
    @protein = @recipe.calculate(:protein, @recipe)
    @lipid = @recipe.calculate(:lipid, @recipe)
    @carbohydrate = @recipe.calculate(:carbohydrate, @recipe)
    @salt = @recipe.calculate(:salt, @recipe)
  end

  def search
    @q = Recipe.ransack(params[:q])
    @recipes = @q.result(distinct: true).page(params[:page]).per(6)
    @search = params[:q][:cuisine_name_or_ingredients_name_cont]
# 取得したgenre_id_eqをnameに変換
# find_byでカラムから探す。tryでエラーではなくnilを返す
    @search_genre = Genre.find_by(id: params[:q][:genre_id_eq]).try(:name)
  end


  def edit
    @title = "#{@recipe.cuisine_name}の編集"
    @materials = Material.all
    @genres = Genre.all
    if @recipe.user == current_user
      render :edit
    else
      redirect_back fallback_location: root_path, flash: { alert: "他人のレシピは編集できません" }
    end
  end

  def update
    if @recipe.update(recipe_params)
    @recipe.ingredients.each do |ing|
      material = Material.find_by(name: ing.name)
      if material
        ing.update!(material_id: material.id)
      else
        ing.update!(material_id: nil)
      end
    end
      redirect_to recipe_path(@recipe), flash: { notice: "「#{@recipe.cuisine_name}」のレシピを更新しました。" }
    else
      flash.now[:notice] = "記入の漏れがあります。"
      redirect_back fallback_location: recipe_path(@recipe)
    end
  end

  def destroy
    @recipe.destroy!
    redirect_to recipes_path, flash: { notice: "レシピを削除しました。" }
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
      :genre_id,
      :image,
      ingredients_attributes: [:id, :name, :unit, :amount, :_destroy],
      steps_attributes: [:id, :direction, :_destroy]
    )
  end

end
