class RemoveFoodstuffIdFromNutritions < ActiveRecord::Migration[6.1]
  def change
    remove_column :nutritions, :foodstuff_id, :integer
  end
end
