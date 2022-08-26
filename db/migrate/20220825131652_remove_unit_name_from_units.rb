class RemoveUnitNameFromUnits < ActiveRecord::Migration[6.1]
  def change
    remove_column :units, :unit_name, :string
  end
end
