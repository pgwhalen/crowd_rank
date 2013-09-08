class RankingController < ApplicationController

	def create
		ranking_json = params[:ranking_json]
	end

	def new
		@team_group = params[:team_group]
	end
end
