class TeamGroupsController < ApplicationController

	def show
		@team_group = TeamGroup.includes(:teams).find(params[:id])

		@series = []
		# Load team data (nicknames, colors) from db
		@team_group.teams.each do |team|
			@series << { id: team.id, name: team.nickname, color: team.primary_color, data: [] }
		end

		# Load ranking data from db
		# All of this below business should happend on the write side, not read side
		# the following line should instead fetch CompositeRankings
		rankings = Ranking.includes(:ranks)

		combined_rankings_hash = {}
		rankings.each do |r|
			week = r.created_at.beginning_of_week
			if combined_rankings_hash[week]
				combined_rankings_hash[week] << r
			else
				combined_rankings_hash[week] = [r]
			end
		end

		# Ugly, ugly, ugly.  Temporary
		@time_periods = []
		combined_rankings_hash.sort.each do |week, rankings|
			@time_periods << week.to_date.to_s
			composite_ranking = {}
			rankings.each do |ranking|
				ranking.ranks.each do |rank|
					team_id = rank.team_id
					value = rank.value
					if composite_ranking[team_id]
						composite_ranking[team_id] += value
					else
						composite_ranking[team_id] = value
					end
				end
			end
			composite_ranking.each do |team_id, value|
				value = value / rankings.count
				@series.find { |s| s[:id] == team_id }[:data] << value
			end
		end
	end
end
