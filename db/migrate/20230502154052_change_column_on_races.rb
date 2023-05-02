class ChangeColumnOnRaces < ActiveRecord::Migration[7.0]
  def change
    remove_reference :races, :circuit, index:true, foreign_key: true
    add_column :races, :circuit, :string
    add_column :races, :selected_team, :string
  end
end
