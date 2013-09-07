class CreateTeamGroups < ActiveRecord::Migration
  def change
    create_table :team_groups do |t|
      t.string :full_name
      t.string :short_name

    end
  end
end
