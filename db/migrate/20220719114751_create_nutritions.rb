class CreateNutritions < ActiveRecord::Migration[6.1]
  def change
    create_table :nutritions do |t|

      t.timestamps

      t.integer :foodstuff_id
      t.string :calorie
      t.string :protein
      t.string :lipid
      t.string :carbohydrate
      t.string :salt


    end
  end
end
