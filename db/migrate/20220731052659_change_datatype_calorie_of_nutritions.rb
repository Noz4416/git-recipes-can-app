class ChangeDatatypeCalorieOfNutritions < ActiveRecord::Migration[6.1]
  def change
    change_column :nutritions, :calorie, :integer
    change_column :nutritions, :protein, :integer
    change_column :nutritions, :lipid, :integer
    change_column :nutritions, :carbohydrate, :integer
    change_column :nutritions, :salt, :integer
  end
end
