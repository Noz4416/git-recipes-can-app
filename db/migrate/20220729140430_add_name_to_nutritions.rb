class AddNameToNutritions < ActiveRecord::Migration[6.1]
  def change
    add_column :nutritions, :name, :string
  end
end
