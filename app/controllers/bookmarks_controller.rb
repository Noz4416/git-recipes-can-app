class BookmarksController < ApplicationController

  def create
    # require 'active_support/all'
    recipe = Recipe.find(params[:recipe_id])
    # current_user.bookmark(recipe)
    @bookmark = current_user.recipes.new(recipe.dup.attributes)
    recipe.ingredients.each do |ingredient|
      @bookmark.ingredients.new(ingredient.dup.attributes)
    end
    recipe.steps.each do |step|
      @bookmark.steps.new(step.dup.attributes)
    end
    @bookmark.genre_id = 6
    @bookmark.save
    # byebug

    redirect_to recipe_path(@bookmark)
  end

  # def destroy
  #   recipe = current_user.bookmarks.find(params[:id]).recipe
  #   current_user.unbookmark(recipe)
  # # ユーザーが直前にリクエストを送ったページに戻す
  #   redirect_back fallback_location: root_path
  # end


end
