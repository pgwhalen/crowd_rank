class CreateRanks < ActiveRecord::Migration
  def change
    create_table :ranks do |t|
      t.integer :value
      t.string :comment
      t.integer :ranking_id
      t.integer :team_id

      t.timestamps
    end
  end
end
