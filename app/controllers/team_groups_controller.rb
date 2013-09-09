class TeamGroupsController < ApplicationController

	def show
		puts params
		@team_group = TeamGroup.find(params[:id])
	end
end
