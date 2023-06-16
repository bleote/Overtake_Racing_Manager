class CreateLapTimes < ActiveRecord::Migration[7.0]
  def change
    create_table :lap_times do |t|
      t.references :driver, null: false, foreign_key: true
      t.integer :time

      t.timestamps
    end
  end
end
