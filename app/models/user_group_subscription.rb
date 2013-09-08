class UserGroupSubscription < ActiveRecord::Base
	belongs_to :user
	belongs_to :user_group_subscription
end
