class AddDnfToCars < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :dnf, :boolean, default: false
  end
end
