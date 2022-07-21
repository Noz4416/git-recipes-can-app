class RemoveCookProcessFromRecipes < ActiveRecord::Migration[6.1]
  def change
    remove_column :recipes, :cook_process, :string
  end
end
