class Ranking < ActiveRecord::Base
	has_many :ranks
	belongs_to :user
	belongs_to :team_group
end
