class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :team_name
      t.string :team_logo
      t.string :color
      t.string :description
      t.integer :team_points

      t.timestamps
    end
  end
end
