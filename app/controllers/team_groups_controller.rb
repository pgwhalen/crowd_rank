require "#{Rails.root}/app/helpers/date_helper"
include DateHelper

class TeamGroupsController < ApplicationController

	def show
		@team_group = TeamGroup.includes(:teams).find_by_short_name(params[:id])
		@user_group = params[:user_group] ? UserGroup.find(params[:user_group]) : UserGroup.find_by_name("Everyone")

		@series = []
		# Load team data (nicknames, colors) from db
		@team_group.teams.order(:nickname).each do |team|
			@series << { id: team.id, name: team.nickname, color: team.primary_color, data: [], marker: { enabled: false, symbol: 'circle' } }
		end

		# Load teams and visions from db for easy chart modification
		@child_team_groups = @team_group.descendants.includes(:teams)
		@team_group_team_ids = {}
		@child_team_groups.each do |tg|
			@team_group_team_ids[tg.id] = tg.teams.map { |t| t.id }
		end

		# Load composite ranking data from db
		composite_rankings = CompositeRanking.includes(:composite_ranks).where(team_group_id: @team_group.id, user_group_id: @user_group.id).order(:period_start_at)
		@time_periods = []
		composite_rankings.each do |cr|
			@time_periods << cr.period_start_at.to_date.strftime('%b %e')
			cr.composite_ranks.each do |r|
				@series.find { |s| s[:id] == r.team_id }[:data] << r.value
			end
		end

		# Calculate biggest movers
		movement = {}
		composite_rankings[-2].composite_ranks.each do |r|
			movement[r.team_id] = r.value
		end
		composite_rankings.last.composite_ranks.each do |r|
			movement[r.team_id] = movement[r.team_id] - r.value
		end

		teams_by_change = movement.sort_by { |team, val| val }
		@biggest_uppers = teams_by_change.last(3).reverse
		@biggest_downers = teams_by_change.first(3)

		puts "*********** UP"
		puts "#{@biggest_uppers}"
		puts "*********** DOWN"
		puts "#{@biggest_downers}"
	end
end
