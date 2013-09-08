class CreateJoinTableUserGroupTeamGroup < ActiveRecord::Migration
  def change
    create_join_table :user_groups, :team_groups do |t|
      t.index [:user_group_id, :team_group_id], name: :user_g_team_g_index
      t.index [:team_group_id, :user_group_id], name: :team_g_user_g_index
    end
  end
end
