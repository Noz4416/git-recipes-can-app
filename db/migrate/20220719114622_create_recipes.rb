class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|

      t.timestamps

      t.integer :users_id
      t.integer :foodstuffs_id
      t.integer :genres_id
      t.string :cuisine_name
      t.string :quantity
      t.string :cook_process
      t.string :memo

    end
  end
end
