class AddRecipeIdToFoodstuffs < ActiveRecord::Migration[6.1]
  def change
    add_column :foodstuffs, :recipe_id, :integer
  end
end
