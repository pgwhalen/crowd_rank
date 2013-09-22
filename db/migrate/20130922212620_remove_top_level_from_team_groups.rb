class RemoveTopLevelFromTeamGroups < ActiveRecord::Migration
  def change
    remove_column :team_groups, :top_level, :boolean
  end
end
