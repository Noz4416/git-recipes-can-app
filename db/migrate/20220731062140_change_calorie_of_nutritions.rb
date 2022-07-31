class ChangeCalorieOfNutritions < ActiveRecord::Migration[6.1]
  def change
    change_column :nutritions, :calorie, :float
    change_column :nutritions, :protein, :float
    change_column :nutritions, :lipid, :float
    change_column :nutritions, :carbohydrate, :float
    change_column :nutritions, :salt, :float
  end
end
