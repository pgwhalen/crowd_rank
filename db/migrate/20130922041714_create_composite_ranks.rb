class CreateCompositeRanks < ActiveRecord::Migration
  def change
    create_table :composite_ranks do |t|
      t.integer :team_id
      t.integer :composite_ranking_id
      t.integer :value

      t.timestamps
    end
  end
end
