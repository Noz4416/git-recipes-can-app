class CreateMaterials < ActiveRecord::Migration[6.1]
  def change
    create_table :materials do |t|

      t.timestamps

      t.string :name
      t.float :calorie
      t.float :protein
      t.float :lipid
      t.float :carbohydrate
      t.float :salt

    end
  end
end
