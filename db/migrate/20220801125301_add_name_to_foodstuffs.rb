class AddNameToFoodstuffs < ActiveRecord::Migration[6.1]
  def change
    add_column :foodstuffs, :name, :string
  end
end
