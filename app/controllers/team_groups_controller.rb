require "#{Rails.root}/app/helpers/date_helper"
include DateHelper

class TeamGroupsController < ApplicationController

	def show
		@team_group = TeamGroup.includes(:teams).find(params[:id])
		@user_group = params[:user_group] ? UserGroup.find(params[:user_group]) : UserGroup.find_by_name("Everyone")

		@series = []
		# Load team data (nicknames, colors) from db
		@team_group.teams.order(:nickname).each do |team|
			@series << { id: team.id, name: team.nickname, color: team.primary_color, data: [] }
		end

		# Load composed ranking data from db
		composite_rankings = CompositeRanking.includes(:composite_ranks).where(team_group_id: @team_group.id, user_group_id: @user_group.id).order(:period_start_at)
		@time_periods = []
		composite_rankings.each do |cr|
			@time_periods << cr.period_start_at.to_date.strftime('%b %e')
			cr.composite_ranks.each do |r|
				@series.find { |s| s[:id] == r.team_id }[:data] << r.value
			end
		end

	end
end
