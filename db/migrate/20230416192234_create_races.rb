class CreateRaces < ActiveRecord::Migration[7.0]
  def change
    create_table :races do |t|
      t.references :user, null: false, foreign_key: true
      t.string :selected_circuit
      t.string :selected_team
      t.string :weather
      t.string :status
      t.references :team01, null: false, foreign_key: { to_table: 'teams' }
      t.references :team02, null: false, foreign_key: { to_table: 'teams' }
      t.references :team03, null: false, foreign_key: { to_table: 'teams' }
      t.references :team04, null: false, foreign_key: { to_table: 'teams' }
      t.references :team05, null: false, foreign_key: { to_table: 'teams' }
      t.references :team06, null: false, foreign_key: { to_table: 'teams' }
      t.references :team07, null: false, foreign_key: { to_table: 'teams' }
      t.references :team08, null: false, foreign_key: { to_table: 'teams' }
      t.references :team09, null: false, foreign_key: { to_table: 'teams' }
      t.references :team10, null: false, foreign_key: { to_table: 'teams' }

      t.timestamps
    end
  end
end
