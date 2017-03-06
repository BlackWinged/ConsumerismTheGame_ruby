class DropEconObj < ActiveRecord::Migration[5.0]
  def change
    drop_table :economic_objects
  end
end
