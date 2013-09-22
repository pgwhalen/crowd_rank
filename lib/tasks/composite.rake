require "#{Rails.root}/app/helpers/date_helper"
include DateHelper

namespace :composite do

	desc "Remove all composite rankings for a TeamGroup/UserGroup pair"
	task :remove, [:team_group_id, :user_group_id] => :environment do |t, args|
		CompositeRanking.where(team_group_id: args['team_group_id'], user_group_id: args['user_group_id']).destroy_all
	end

	desc "Create (empty) all possible (weekly) composite rankings for a TeamGroup/UserGroup"
	task :create, [:team_group_id, :user_group_id] => :environment do |t, args|
		user_ids = UserGroup.find(args['user_group_id']).users.map { |u| u.id }

		rankings = Ranking.where(user_id: user_ids, team_group_id: (args['team_group_id']))

		earliest_date = rankings.minimum(:created_at)
		latest_date = rankings.maximum(:created_at)

		date_iter =  current_or_last_day_of_week(2, earliest_date)
		ActiveRecord::Base.transaction do 
			while date_iter < latest_date do
				CompositeRanking.create!(team_group_id: args['team_group_id'],
																 user_group_id: args['user_group_id'],
																 period_start_at: date_iter,
																 period_end_at: date_iter + 1.week
																)
				date_iter = date_iter + 1.week
			end
		end
	end
	
	desc "Recalculate all composite rankings for a TeamGroup/UserGroup pair"
	task :recalculate, [:team_group_id, :user_group_id] => :environment do |t, args|
		team_group_id = args['team_group_id']
		user_group_id = args['user_group_id']
		user_ids = UserGroup.find(user_group_id).users.map { |u| u.id }
		

		composite_rankings = CompositeRanking.where(team_group_id: team_group_id, user_group_id: user_group_id)
		composite_rankings.each do |cr|
			rankings = Ranking.where(team_group_id: team_group_id, user_id: user_ids, created_at: cr.period_start_at..cr.period_end_at)
			
			new_composite_hash = {}
			rankings.each do |ranking|
				ranking.ranks.each do |rank|
					team_id = rank.team_id
					value = rank.value
					if new_composite_hash[team_id]
						new_composite_hash[team_id] += value
					else
						new_composite_hash[team_id] = value
					end
				end
			end

			new_composite_ranking = {}
			new_composite_hash.each do |team_id, value|
				new_value = value.to_f / rankings.count
				new_composite_ranking[team_id] = new_value
			end

			new_ranks = new_composite_ranking.sort_by { |team, val| val }

			ActiveRecord::Base.transaction do
				composite_value = 1
				ranks_list = []
				new_ranks.each do |r|
					ranks_list << { team_id: r[0],
													value: composite_value,
													composite_ranking_id: cr.id
												}
					composite_value += 1
				end
				CompositeRank.create!(ranks_list)
			end

		end
	end

	desc "Remove, create, and recalculate composite rankings for TeamGroup/UserGroup pair"
	task :clean_and_recompile, [:team_group_id, :user_group_id] => :environment do |t, args|
		team_group_id = args[:team_group_id]
		user_group_id = args[:user_group_id]

		Rake::Task["composite:remove"].invoke(team_group_id, user_group_id)
		Rake::Task["composite:create"].invoke(team_group_id, user_group_id)
		Rake::Task["composite:recalculate"].invoke(team_group_id, user_group_id)
	end
end