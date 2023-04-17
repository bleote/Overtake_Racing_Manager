class AddConstructorToCar < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :constructor, :string
  end
end
