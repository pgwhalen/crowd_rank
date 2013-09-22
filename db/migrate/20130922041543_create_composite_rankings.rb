class CreateCompositeRankings < ActiveRecord::Migration
  def change
    create_table :composite_rankings do |t|
      t.integer :team_group_id
      t.integer :user_group_id
      t.datetime :period_start_at
      t.datetime :period_end_at

      t.timestamps
    end
  end
end
