class CreateTeamsTeamsGroupsJoinTable < ActiveRecord::Migration
  def change
    create_join_table :teams, :team_groups do |t|
      t.index [:team_id, :team_group_id]
      t.index [:team_group_id, :team_id]
    end
  end
end
