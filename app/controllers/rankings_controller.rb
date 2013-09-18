class RankingsController < ApplicationController

	def create
		# This doesn't need to be a super responsive action,
		# but if speed becomes a problem, maybe consider raw SQL
		# for a multi query
		# It wouldn't be the craziest thing in the world for it
		# to kick off a job either, and render a result page straight
		# from the JSON

		ranking_json = JSON.parse(params[:ranking_json])
		team_group_id = params[:ranking][:team_group]

		ActiveRecord::Base.transaction do
			ranking = Ranking.create!(user_id: current_user.id, team_group_id: team_group_id)

			ranks_list = []
			ranking_json.each do |team_id, data|
				ranks_list << { team_id: team_id,
												value: data['rank'],
												comment: data['comment'],
												ranking_id: ranking.id}
			end
		end

		redirect_to TeamGroup.find(team_group_id)
	end

	def new
		@team_group = params[:team_group]
		@team_group = TeamGroup.find_by_short_name("NFL") # fake line for now; rankings/new should be a GET with a team_group_id in URL

		# TODO: this should take the latest 'everyone' composite
		@teams = Ranking.where(team_group_id: @team_group.id).last.ranks #
	end
end
