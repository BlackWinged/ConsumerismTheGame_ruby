class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.integer :quantity
      t.belongs_to :product

      t.timestamps
    end
  end
end
