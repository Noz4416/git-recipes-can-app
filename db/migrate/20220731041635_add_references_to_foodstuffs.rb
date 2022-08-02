class AddReferencesToFoodstuffs < ActiveRecord::Migration[6.1]
  def change
    add_reference :foodstuffs, :recipe, null: false, foreign_key: true
    add_reference :foodstuffs, :nutrition, null: false, foreign_key: true
  end
end
