class AddColumnToDrivers < ActiveRecord::Migration[7.0]
  def change
    add_reference :drivers, :team, null: false, foreign_key: true
    add_reference :drivers, :car, null: false, foreign_key: true
  end
end
