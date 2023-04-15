class RemoveColumnFromTeams < ActiveRecord::Migration[7.0]
  def change
    remove_reference :teams, :car, null: false, foreign_key: true
    remove_reference :teams, :chief, null: false, foreign_key: true
    remove_reference :teams, :driver, null: false, foreign_key: true
  end
end
