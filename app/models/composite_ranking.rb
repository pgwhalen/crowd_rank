class CompositeRanking < ActiveRecord::Base
	has_many :composite_ranks, dependent: :destroy
	belongs_to :user
	belongs_to :team_group
end
