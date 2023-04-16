class CreateChiefs < ActiveRecord::Migration[7.0]
  def change
    create_table :chiefs do |t|
      t.string :chief_name
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
