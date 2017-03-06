class DropOffers < ActiveRecord::Migration[5.0]
  def change
    drop_table :offers
  end
end
