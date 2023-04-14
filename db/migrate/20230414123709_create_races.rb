class CreateRaces < ActiveRecord::Migration[7.0]
  def change
    create_table :races do |t|
      t.references :user, null: false, foreign_key: true
      t.references :circuit, null: false, foreign_key: true
      t.string :weather
      t.references :team, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
