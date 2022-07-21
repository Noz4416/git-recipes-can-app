class AddRecipeIdToSteps < ActiveRecord::Migration[6.1]
  def change
    add_column :steps, :recipe_id, :integer
  end
end
