class AddColorsToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :primary_color, :string
    add_column :teams, :secondary_color, :string
  end
end
