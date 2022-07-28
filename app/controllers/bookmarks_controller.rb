class BookmarksController < ApplicationController

  def create
    @recipe = Recipe.find(params[:recipe_id])
    current_user.bookmark(@recipe)
  end

  def destroy
    @recipe = current_user.bookmarks.find(params[:recipe_id]).recipe
    current_user.unbookmark(@recipe)
  # ユーザーが直前にリクエストを送ったページに戻す
    redirect_back
  end
end
