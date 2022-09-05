class AddNameToUnits < ActiveRecord::Migration[6.1]
  def change
    add_column :units, :unit, :integer
  end
end
