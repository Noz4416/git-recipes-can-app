class CreateUnits < ActiveRecord::Migration[6.1]
  def change
    create_table :units do |t|

      t.timestamps

      t.string :unit_name
      t.integer :ml
      t.integer :g

    end
  end
end
