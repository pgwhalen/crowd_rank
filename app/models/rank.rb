class Rank < ActiveRecord::Base
	belongs_to :ranking
	belongs_to :team
end
