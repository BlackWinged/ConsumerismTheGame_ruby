class AddRefererToBetAnals < ActiveRecord::Migration[5.0]
  def change
    add_column :bet_anals, :refererUrl, :string
  end
end
