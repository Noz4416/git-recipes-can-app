class RemoveFoodstuffIdFromRecipes < ActiveRecord::Migration[6.1]
  def change
    remove_column :recipes, :foodstuff_id, :integer
  end
end
