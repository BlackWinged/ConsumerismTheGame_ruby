class CreateBetAnals < ActiveRecord::Migration[5.0]
  def change
    create_table :bet_anals do |t|
      t.integer :undrawnCycleCount
      t.integer :undrawnBallCount
      t.datetime :measuredTime

      t.timestamps
    end
  end
end
