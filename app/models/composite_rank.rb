class CompositeRank < ActiveRecord::Base
	belongs_to :composite_ranking
	belongs_to :team
end
