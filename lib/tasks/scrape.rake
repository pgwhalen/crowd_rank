require 'open-uri'

namespace :scrape do
	namespace :nfl do
		desc "Scrape ESPN for power ranking data"
		task espn: :environment do
			doc = Nokogiri::HTML(open("https://espn.go.com/nfl/powerrankings"))
			rows = doc.css(".evenrow") + doc.css(".oddrow")

			ranks = {}
			rows.each do |r|
				ranks[r.css("a").text] = r.css(".pr-rank").text.to_i
			end

			puts ranks
		end
	end
end
