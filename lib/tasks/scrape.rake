require 'open-uri'

namespace :scrape do
	namespace :nfl do

		desc "Scrape ESPN"
		task espn: :environment do
			user = User.find_by_username("ESPN")
			ranks = {}

			## Scrape
			doc = Nokogiri::HTML(open("https://espn.go.com/nfl/powerrankings"))
			rows = doc.css(".evenrow") + doc.css(".oddrow")

			rows.each do |r|
				nickname = r.css("a").text
				comment = r.css("td")[3].text if r.css("td")[3]
				if comment
					ranks[r.css(".pr-rank").text.to_i] = {nickname: nickname, comment: comment}
				end
			end
			puts ranks.to_yaml

			## Database

		end

		desc "Scrape SI (Chris Burke)"
		task si: :environment do
			user = User.find_by_username("Chris Burke")
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
			puts ranks.to_yaml

			## Database

		end

	end
end
