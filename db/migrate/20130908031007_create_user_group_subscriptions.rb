class CreateUserGroupSubscriptions < ActiveRecord::Migration
  def change
    create_table :user_group_subscriptions do |t|
    	t.integer :user_id
    	t.integer :user_group_subscription_id
      t.timestamps
    end
  end
end
