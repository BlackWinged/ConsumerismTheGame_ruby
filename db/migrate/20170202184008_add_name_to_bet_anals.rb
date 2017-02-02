class AddNameToBetAnals < ActiveRecord::Migration[5.0]
  def change
    add_column :bet_anals, :nameOfLoto, :string
  end
end
