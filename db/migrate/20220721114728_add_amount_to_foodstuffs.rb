class AddAmountToFoodstuffs < ActiveRecord::Migration[6.1]
  def change
    add_column :foodstuffs, :amount, :string
  end
end
