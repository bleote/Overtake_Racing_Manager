class RemoveColumnFromCars < ActiveRecord::Migration[7.0]
  def change
    remove_reference :cars, :driver, null: false, foreign_key: true
  end
end
