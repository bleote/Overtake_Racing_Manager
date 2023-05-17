class AddCircuitToRaces < ActiveRecord::Migration[7.0]
  def change
    add_reference :races, :circuit, null: true, foreign_key: true
  end
end
