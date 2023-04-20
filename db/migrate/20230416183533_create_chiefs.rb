class CreateChiefs < ActiveRecord::Migration[7.0]
  def change
    create_table :chiefs do |t|
      t.string :chief_name
      t.string :chief_image
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
