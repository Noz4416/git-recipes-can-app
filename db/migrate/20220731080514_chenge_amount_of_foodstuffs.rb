class ChengeAmountOfFoodstuffs < ActiveRecord::Migration[6.1]
  def change
    change_column :foodstuffs, :amount, :integer
  end
end
