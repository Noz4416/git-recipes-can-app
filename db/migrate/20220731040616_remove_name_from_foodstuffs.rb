class RemoveNameFromFoodstuffs < ActiveRecord::Migration[6.1]
  def change
    remove_column :foodstuffs, :name, :string
    remove_column :foodstuffs, :nutrition_id, :integer
    remove_column :foodstuffs, :recipe_id, :integer
  end
end
