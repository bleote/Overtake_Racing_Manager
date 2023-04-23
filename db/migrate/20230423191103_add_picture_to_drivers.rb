class AddPictureToDrivers < ActiveRecord::Migration[7.0]
  def change
    add_column :drivers, :driver_picture, :string
  end
end
