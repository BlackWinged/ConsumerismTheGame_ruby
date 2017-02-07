class CreateOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :offers do |t|
      t.belongs_to :source
      t.belongs_to :target
      t.string :message
      t.decimal :money
      t.timestamps
    end
  end
end
