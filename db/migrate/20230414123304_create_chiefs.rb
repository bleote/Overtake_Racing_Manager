class CreateChiefs < ActiveRecord::Migration[7.0]
  def change
    create_table :chiefs do |t|
      t.string :chief_name

      t.timestamps
    end
  end
end
