class GenresController < ApplicationController

  def index
    @genres = Genre.all
  end

  def create
    genre = Genre.new
    genre.save
    redirect_to genres_path
  end

  def destroy
    genre = Genre.find(params[:id])
    genre.destroy
    redirect_to genres_path
end
