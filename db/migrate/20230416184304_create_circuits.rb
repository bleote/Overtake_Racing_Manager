class CreateCircuits < ActiveRecord::Migration[7.0]
  def change
    create_table :circuits do |t|
      t.string :circuit_name
      t.string :circuit_layout
      t.string :circuit_flag
      t.integer :slow_curves
      t.integer :medium_curves
      t.integer :fast_curves
      t.integer :short_straights
      t.integer :medium_straights
      t.integer :long_straights
      t.integer :pitstop_time
      t.integer :ideal_lap_time

      t.timestamps
    end
  end
end
