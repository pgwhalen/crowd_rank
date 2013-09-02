class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :full_name
      t.string :location
      t.string :nickname
    end
  end
end
