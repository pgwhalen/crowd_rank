class AddAncestryToTeamGroup < ActiveRecord::Migration
  def change
    add_column :team_groups, :ancestry, :string

    add_index :team_groups, :ancestry
  end
end
