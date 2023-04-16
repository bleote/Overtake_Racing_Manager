class RemoveColumnFromRaces < ActiveRecord::Migration[7.0]
  def change
    remove_reference :races, :team, null: false, foreign_key: true
  end
end
