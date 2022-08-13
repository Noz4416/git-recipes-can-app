class BookmarksController < ApplicationController

  def create
    recipe = Recipe.find(params[:recipe_id])
    current_user.bookmark(recipe)
    redirect_back fallback_location: root_path
  end

  def destroy
    recipe = current_user.bookmarks.find(params[:id]).recipe
    current_user.unbookmark(recipe)
  # ユーザーが直前にリクエストを送ったページに戻す
    redirect_back fallback_location: root_path
  end


end
