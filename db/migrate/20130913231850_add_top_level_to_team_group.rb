class AddTopLevelToTeamGroup < ActiveRecord::Migration
  def change
    add_column :team_groups, :top_level, :boolean, default: false
  end
end
