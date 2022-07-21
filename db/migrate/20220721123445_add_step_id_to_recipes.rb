class AddStepIdToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :step_id, :integer
  end
end
