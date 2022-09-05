class AddMaterialIdToUnits < ActiveRecord::Migration[6.1]
  def change
    add_column :units, :material_id, :integer
  end
end
