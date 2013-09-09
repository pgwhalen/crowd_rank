class TeamGroupsController < ApplicationController

	def show
		@team_group = TeamGroup.find(params[:id])
	end
end
