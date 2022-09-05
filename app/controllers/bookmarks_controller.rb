class BookmarksController < ApplicationController

  before_action :authenticate_user!, only: [:create]

  def create
    recipe = Recipe.find(params[:recipe_id])
    @bookmark = current_user.recipes.new(recipe.dup.attributes)
    recipe.ingredients.each do |ingredient|
      @bookmark.ingredients.new(ingredient.dup.attributes)
    end
    recipe.steps.each do |step|
      @bookmark.steps.new(step.dup.attributes)
    end
    @bookmark.genre_id = 6
    @bookmark.save!
# 保存をするために、先にsaveして@bookmark.idを確定させる
# blobのioが閉じる前に読み書きする必要がある
    recipe.image.blob.open do |tempfile|
      @bookmark.image.attach(io: tempfile, filename: recipe.image.filename)
      @bookmark.image.save!
    end
    redirect_to recipe_path(@bookmark)
  end

  # def destroy
  #   recipe = current_user.bookmarks.find(params[:id]).recipe
  #   current_user.unbookmark(recipe)
  # # ユーザーが直前にリクエストを送ったページに戻す
  #   redirect_back fallback_location: root_path
  # end

end
