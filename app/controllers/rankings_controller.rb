class RankingsController < ApplicationController

	def create
		ranking_json = params[:ranking_json]
	end

	def new
		@team_group = params[:team_group]
		@team_group = TeamGroup.find_by_short_name("NFL")
	end
end
