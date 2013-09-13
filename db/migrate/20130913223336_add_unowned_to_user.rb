class AddUnownedToUser < ActiveRecord::Migration
  def change
    add_column :users, :unowned, :boolean, default: false
  end
end
