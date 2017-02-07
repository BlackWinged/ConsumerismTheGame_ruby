class AddOfferToItem < ActiveRecord::Migration[5.0]
  def change
    change_table :items do |t|
      t.belongs_to :offer
    end
  end
end
