class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :constructor
      t.references :driver, null: false, foreign_key: true
      t.string :engine
      t.integer :gearbox
      t.integer :suspension
      t.integer :wings
      t.string :aero_setup
      t.string :gear_ratio
      t.string :tyres

      t.timestamps
    end
  end
end
