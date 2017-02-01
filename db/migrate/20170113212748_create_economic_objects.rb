class CreateEconomicObjects < ActiveRecord::Migration[5.0]
  def change
    create_table :economic_objects do |t|
      t.integer :supply
      t.decimal :production
      t.decimal :costOfStorage
      t.decimal :funds
      t.string :type
      t.string :name
      t.belongs_to :user

      t.timestamps
    end
  end
end
