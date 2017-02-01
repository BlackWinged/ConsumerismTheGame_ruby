class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :type
      t.decimal :price
      t.decimal :demand

      t.timestamps
    end
  end
end
