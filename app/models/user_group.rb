class UserGroup < ActiveRecord::Base
	has_many :user_group_subscriptions
	has_many :users, through: :user_group_subscriptions
	has_and_belongs_to_many :team_groups
end
