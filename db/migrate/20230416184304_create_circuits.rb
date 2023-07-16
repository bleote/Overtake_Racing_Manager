class CreateCircuits < ActiveRecord::Migration[7.0]
  def change
    create_table :circuits do |t|
      t.string :country
      t.string :name
      t.string :circuit
      t.string :layout
      t.string :flag
      t.string :ideal_aero_setup
      t.string :ideal_gear_ratio
      t.integer :slow_corners
      t.integer :medium_corners
      t.integer :fast_corners
      t.integer :short_straights
      t.integer :medium_straights
      t.integer :long_straights
      t.integer :pitstop_time
      t.integer :ideal_lap_time
      t.integer :total_laps

      t.timestamps
    end
  end
end
