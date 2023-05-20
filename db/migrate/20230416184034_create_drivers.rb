class CreateDrivers < ActiveRecord::Migration[7.0]
  def change
    create_table :drivers do |t|
      t.string :driver_name
      t.string :driver_picture
      t.string :helmet
      t.references :team, null: false, foreign_key: true
      t.references :car, null: false, foreign_key: true
      t.integer :driving_skills
      t.integer :fitness_level
      t.integer :overtaking
      t.integer :defending
      t.integer :wet_race
      t.integer :driver_points

      t.timestamps
    end
  end
end
