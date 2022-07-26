class RemoveGenreIdFromRecipes < ActiveRecord::Migration[6.1]
  def change
    remove_column :recipes, :genre_id, :integer
  end
end
