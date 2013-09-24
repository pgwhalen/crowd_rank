require 'open-uri'

namespace :scrape do
	namespace :nfl do

		desc "Scrape ESPN"
		task espn: :environment do
			user = User.find_by_username("ESPN")
			ranks = {}

			## Scrape
			doc = Nokogiri::HTML(open("http://espn.go.com/nfl/powerrankings"))
			rows = doc.css(".evenrow") + doc.css(".oddrow")

			rows.each do |r|
				# the number of anchor tags determines what to do with the row
				if r.css("a").count == 2 # deal with a link inside the comment
					nickname = r.css("a").text
				elsif r.css("a").count > 2
					nickname = r.css("a")[1].text
				end

				comment = r.css("td")[3].text if r.css("td")[3]
				if comment
					ranks[r.css(".pr-rank").text.to_i] = {nickname: nickname, comment: comment}
				end
			end

			## Database
			ActiveRecord::Base.transaction do
				ranking = Ranking.create!(user_id: user.id, team_group_id: TeamGroup.find_by_short_name("NFL").id)

				ranks_list = []
				ranks.each do |rank, meta|
					ranks_list << { team_id: Team.find_by_nickname(meta[:nickname]).id,
													value: rank,
													comment: meta[:comment],
													ranking_id: ranking.id}
				end

				Rank.create!(ranks_list)
			end
		end

		desc "Scrape SI (Chris Burke)"
		task si: :environment do
			user = User.find_by_username("Chris Burke (SI)")
			ranks = {}

			## Scrape
			# find most recent power ranking from his archive page
			doc = Nokogiri::HTML(open("http://sportsillustrated.cnn.com/writers/chris_burke/archive/"))
			a = doc.xpath("//li//a").find { |a| /(.*)Power Ranking(.*)/.match(a.to_s) }
			pr_url = "http://sportsillustrated.cnn.com" + a['href']
			
			# actual power ranking page
			doc = Nokogiri::HTML(open(pr_url))

			i = 0
			doc.css(".col1").each do |col|
				i += 1
				match = /<(.*)\/div>(.*)<\/td>/.match(col.to_s) # UGH. si did not leave many options

				if match
					full_name = />(.*)<\/a/.match(match[1]).to_s[1..-4]
					comment = match[2]

					ranks[i/2] = { full_name: full_name, comment: comment }
				end
			end

			## Database
			ActiveRecord::Base.transaction do
				ranking = Ranking.create!(user_id: user.id, team_group_id: TeamGroup.find_by_short_name("NFL").id)

				ranks_list = []
				ranks.each do |rank, meta|
					ranks_list << { team_id: Team.find_by_full_name(meta[:full_name]).id,
													value: rank,
													comment: meta[:comment],
													ranking_id: ranking.id}
				end

				Rank.create!(ranks_list)
			end
		end

		desc "Scrape Fox (Brian Billick)"
		task fox: :environment do
			user = User.find_by_username("Brian Billick (Fox)")
			ranks = {}

			## Scrape
			doc = Nokogiri::HTML(open("http://msn.foxsports.com/nfl/powerRankings"))
			rows = doc.css(".on") + doc.css(".off")

			rows.each do |r|
				td_tag_val = /td>(.*)</.match(r.to_s)
				if td_tag_val
					value = td_tag_val[1]
					nickname = r.css('.teamLogo').text.strip
					comment = r.css('.show_min').text.strip

					ranks[value] = { nickname: nickname, comment: comment }
				end
			end

			## Database
			ActiveRecord::Base.transaction do
				ranking = Ranking.create!(user_id: user.id, team_group_id: TeamGroup.find_by_short_name("NFL").id)

				ranks_list = []
				ranks.each do |rank, meta|
					ranks_list << { team_id: Team.find_by_nickname(meta[:nickname]).id,
													value: rank,
													comment: meta[:comment],
													ranking_id: ranking.id}
				end

				Rank.create!(ranks_list)
			end
		end

		desc "Run every nfl scrape"
		task nfl: :environment do
			tasks = ["espn", "si", "fox"]
			if DateTime.now.utc.wday == 2  # this is a Heroku Scheduler hack so it only runs on tuesday
				tasks.each do |t|
					Rake::Task["nfl:" + t].invoke
				end
				team_group_id = TeamGroup.find_by_short_name("NFL").id
				user_group_id = UserGroup.find_by_name("Everyone").id
				Rake::Task["composite:clean_and_recompile"].invoke(team_group_id, user_group_id)
			end
		end
	end
end
