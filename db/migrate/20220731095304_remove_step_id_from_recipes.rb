class RemoveStepIdFromRecipes < ActiveRecord::Migration[6.1]
  def change
    remove_column :recipes, :step_id, :integer
  end
end
