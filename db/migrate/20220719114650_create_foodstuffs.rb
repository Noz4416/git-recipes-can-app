class CreateFoodstuffs < ActiveRecord::Migration[6.1]
  def change
    create_table :foodstuffs do |t|

      t.timestamps

      t.string :name
      t.integer :units_id
      t.integer :nutritions_id

    end
  end
end
