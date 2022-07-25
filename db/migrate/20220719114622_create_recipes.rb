class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|

      t.timestamps

      t.integer :user_id
      t.integer :foodstuff_id
      t.integer :genre_id
      t.string :cuisine_name
      t.string :quantity
      t.integer :step_id
      t.string :memo

    end
  end
end
