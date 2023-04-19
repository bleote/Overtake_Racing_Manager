class AddPrestigeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :experience, :integer
    add_column :users, :prestige, :integer
  end
end
