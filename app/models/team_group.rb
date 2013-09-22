class TeamGroup < ActiveRecord::Base
	has_and_belongs_to_many :teams
	has_and_belongs_to_many :user_groups
	has_ancestry
end
