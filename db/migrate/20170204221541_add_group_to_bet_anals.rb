class AddGroupToBetAnals < ActiveRecord::Migration[5.0]
  def change
    add_column :bet_anals, :group, :integer
  end
end
