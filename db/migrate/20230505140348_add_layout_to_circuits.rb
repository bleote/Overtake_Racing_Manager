class AddLayoutToCircuits < ActiveRecord::Migration[7.0]
  def change
    add_column :circuits, :circuit_layout, :string
    add_column :circuits, :circuit_flag, :string
  end
end
