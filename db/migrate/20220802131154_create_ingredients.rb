class CreateIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients do |t|

      t.timestamps
      t.integer :recipe_id
      t.integer :material_id
      t.string :amount
      t.boolean :unit_flag, default: true, null: false
    end
  end
end
