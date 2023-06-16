class CreateRaces < ActiveRecord::Migration[7.0]
  def change
    create_table :races do |t|
      t.references :user, null: false, foreign_key: true
      t.references :circuit, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true
      t.string :weather
      t.string :status
      t.references :team_a, null: false, foreign_key: { to_table: 'teams' }
      t.references :team_b, null: false, foreign_key: { to_table: 'teams' }
      t.references :team_c, null: false, foreign_key: { to_table: 'teams' }
      t.references :team_d, null: false, foreign_key: { to_table: 'teams' }
      t.references :team_e, null: false, foreign_key: { to_table: 'teams' }
      t.references :team_f, null: false, foreign_key: { to_table: 'teams' }
      t.references :team_g, null: false, foreign_key: { to_table: 'teams' }
      t.references :team_h, null: false, foreign_key: { to_table: 'teams' }
      t.references :team_i, null: false, foreign_key: { to_table: 'teams' }
      t.references :team_j, null: false, foreign_key: { to_table: 'teams' }

      t.timestamps
    end
  end
end
