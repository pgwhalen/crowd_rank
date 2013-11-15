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
		Rank.create!(ranks_list)

		redirect_to TeamGroup.find(team_group_id)
	end

	def new
		@team_group = params[:team_group]
		@team_group = TeamGroup.find_by_short_name("NFL") # fake line for now; rankings/new should be a GET with a team_group_id in URL

		@teams = CompositeRanking.where(team_group_id: @team_group.id).order(:period_end_at).last.composite_ranks.map { |cr| cr.team }
	end

	def show
		@ranking = Ranking.includes(:ranks).find(params[:id])
		@ranks = @ranking.ranks.order(:value)

		@user = User.find(@ranking.user_id)

		@last_ranking = Ranking.includes(:ranks).where("team_group_id = ? AND
																										user_id = ? AND
																										created_at < ?", @ranking.team_group_id, @user.id, @ranking.created_at).order(:created_at).last
		@last_ranks = @last_ranking.ranks.order(:value)

		@diffs = {}
		@ranks.each do |r|
			@diffs[r.team_id] = @last_ranks.where(team_id: r.team_id).first.value - r.value
		end
		
		puts "-----------------------------"
		puts @last_ranks.where(team_id: 7).first.team.id
	end
end
