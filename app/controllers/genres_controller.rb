class GenresController < ApplicationController

  before_action :authenticate_user!

  def index
    @genres = Genre.all
  end

  def create
    genre = Genre.new(genre_params)
    genre.save!
    redirect_to genres_path
  end

  def destroy
    genre = Genre.find(params[:id])
    genre.destroy!
    redirect_to genres_path
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
