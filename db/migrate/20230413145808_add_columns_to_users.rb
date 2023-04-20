class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :experience, :integer, default: 0
    add_column :users, :prestige, :integer, default: 0
    add_column :users, :user_races, :integer, default: 0
    add_column :users, :user_poles, :integer, default: 0
    add_column :users, :user_podiums, :integer, default: 0
    add_column :users, :user_victories, :integer, default: 0
  end
end
