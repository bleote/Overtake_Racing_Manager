class AddColumnToCars < ActiveRecord::Migration[7.0]
  def change
    add_reference :cars, :team, null: false, foreign_key: true
  end
end
