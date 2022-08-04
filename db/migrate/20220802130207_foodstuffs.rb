class Foodstuffs < ActiveRecord::Migration[6.1]
  def change
    drop_table :foodstuffs
  end
end
