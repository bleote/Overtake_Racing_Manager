class AddTeamsToRaces < ActiveRecord::Migration[7.0]
  def change
    change_table(:races) do |t|
      t.references :team01, foreign_key: { to_table: 'teams' }
      t.references :team02, foreign_key: { to_table: 'teams' }
      t.references :team03, foreign_key: { to_table: 'teams' }
      t.references :team04, foreign_key: { to_table: 'teams' }
      t.references :team05, foreign_key: { to_table: 'teams' }
      t.references :team06, foreign_key: { to_table: 'teams' }
      t.references :team07, foreign_key: { to_table: 'teams' }
      t.references :team08, foreign_key: { to_table: 'teams' }
      t.references :team09, foreign_key: { to_table: 'teams' }
      t.references :team10, foreign_key: { to_table: 'teams' }
    end
    add_foreign_key :races, :teams, column: :team_id
  end
end
