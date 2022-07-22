class CreateSteps < ActiveRecord::Migration[6.1]
  def change
    create_table :steps do |t|

      t.timestamps

      t.string :direction
      t.integer :recipe_id
    end
  end
end
