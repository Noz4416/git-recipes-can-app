class AddNameToIngredients < ActiveRecord::Migration[6.1]
  def change
    add_column :ingredients, :name, :string
    add_column :ingredients, :unit, :integer
  end
end
