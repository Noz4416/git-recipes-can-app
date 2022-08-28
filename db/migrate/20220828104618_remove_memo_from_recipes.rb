class RemoveMemoFromRecipes < ActiveRecord::Migration[6.1]
  def change
    remove_column :recipes, :memo, :string
    remove_column :units, :ml, :integer
    remove_column :units, :conversion, :boolean
    remove_column :ingredients, :unit_flag, :boolean
  end
end
