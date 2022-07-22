class CreateFoodstuffs < ActiveRecord::Migration[6.1]
  def change
    create_table :foodstuffs do |t|

      t.timestamps

      t.string :name
      t.integer :unit_id
      t.integer :nutrition_id
      t.string :amount

    end
  end
end
