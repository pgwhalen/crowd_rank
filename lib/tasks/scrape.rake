require 'open-uri'

namespace :scrape do
	namespace :nfl do
		desc "Scrape ESPN for power ranking data"
		task espn: :environment do
			doc = Nokogiri::HTML(open("https://espn.go.com/nfl/powerrankings"))
			rows = doc.css(".evenrow") + doc.css(".oddrow")

			user = User.find_by_username("ESPN")

			ranks = {}
			rows.each do |r|
				ranks[r.css(".pr-rank").text.to_i] = r.css("a").text
			end
			json = { ranks: ranks, user_id: user.id }

			puts json
		end
	end
end
