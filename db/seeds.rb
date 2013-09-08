# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# NFL Teams
afc_east = Team.create([{ full_name: 'Buffalo Bills', location: 'Buffalo', nickname: 'Saints' },
												{ full_name: 'Miami Dolphins', location: 'Miami', nickname: 'Dolphins' },
												{ full_name: 'New England Patriots', location: 'New England', nickname: 'Patriots' },
												{ full_name: 'New York Jets', location: 'New York', nickname: 'Jets' }])

afc_north = Team.create([{ full_name: 'Baltimore Ravens', location: 'Baltimore', nickname: 'Ravens' },
												 { full_name: 'Cincinnati Bengals', location: 'Cincinnati', nickname: 'Bengals' },
												 { full_name: 'Cleveland Browns', location: 'Cleveland', nickname: 'Browns' },
												 { full_name: 'Pittsburgh Steelers', location: 'Pittsburgh', nickname: 'Steelers' }])

afc_south = Team.create([{ full_name: 'Houston Texans', location: 'Houston', nickname: 'Texans' },
												 { full_name: 'Indianapolis Colts', location: 'Indianapolis', nickname: 'Colts' },
												 { full_name: 'Jacksonville Jaguars', location: 'Jacksonville', nickname: 'Jaguars' },
												 { full_name: 'Tennessee Titans', location: 'Tennessee', nickname: 'Titans' }])

afc_west = Team.create([{ full_name: 'Denver Broncos', location: 'Denver', nickname: 'Broncos' },
											  { full_name: 'Kansas City Chiefs', location: 'Kansas City', nickname: 'Chiefs' },
											  { full_name: 'Oakland Raiders', location: 'Oakland', nickname: 'Raiders' },
											  { full_name: 'San Diego Chargers', location: 'San Diego', nickname: 'Chargers' }])

nfc_east = Team.create([{ full_name: 'Dallas Cowboys', location: 'Dallas', nickname: 'Cowboys' },
											  { full_name: 'New York Giants', location: 'New York', nickname: 'Giants' },
											  { full_name: 'Philadelphia Eagles', location: 'Philadelphia', nickname: 'Eagles' },
											  { full_name: 'Washington Redskins', location: 'Washington', nickname: 'Redskins' }])

nfc_north = Team.create([{ full_name: 'Chicago Bears', location: 'Chicago', nickname: 'Bears' },						 
												 { full_name: 'Detroit Lions', location: 'Detroit', nickname: 'Lions' },
												 { full_name: 'Green Bay Packers', location: 'Green Bay', nickname: 'Packers' },
												 { full_name: 'Minnesota Vikings', location: 'Minnesota', nickname: 'Vikings' }])

nfc_south = Team.create([{ full_name: 'Atlanta Falcons', location: 'Atlanta', nickname: 'Falcons' },
												 { full_name: 'Carolina Panthers', location: 'Carolina', nickname: 'Panthers' },
												 { full_name: 'New Orleans Saints', location: 'New Orleans', nickname: 'Saints' },
												 { full_name: 'Tampa Bay Buccaneers', location: 'Tampa Bay', nickname: 'Buccaneers' }])

nfc_west = Team.create([{ full_name: 'Arizona Cardinals', location: 'Arizona', nickname: 'Cardinals' },
											  { full_name: 'St. Louis Rams', location: 'St. Louis', nickname: 'Rams' },
											  { full_name: 'San Fransisco 49ers', location: 'San Fransisco', nickname: '49ers' },
											  { full_name: 'Seattle Seahawks', location: 'Seattle', nickname: 'Seahawks' }])

TeamGroup.create({ full_name: 'American Football Conference East', short_name: "AFC East"}).teams << afc_east
TeamGroup.create({ full_name: 'American Football Conference North', short_name: "AFC North"}).teams << afc_north
TeamGroup.create({ full_name: 'American Football Conference South', short_name: "AFC South"}).teams << afc_south
TeamGroup.create({ full_name: 'American Football Conference West', short_name: "AFC West"}).teams << afc_west
TeamGroup.create({ full_name: 'National Football Conference East', short_name: "NFC East"}).teams << nfc_east
TeamGroup.create({ full_name: 'National Football Conference North', short_name: "NFC North"}).teams << nfc_north
TeamGroup.create({ full_name: 'National Football Conference South', short_name: "NFC South"}).teams << nfc_south
TeamGroup.create({ full_name: 'National Football Conference West', short_name: "NFC West"}).teams << nfc_west

TeamGroup.create({ full_name: 'American Football Conference', short_name: 'AFC'}).teams << afc_east << afc_north << afc_south << afc_west
TeamGroup.create({ full_name: 'National Football Conference', short_name: 'NFC'}).teams << nfc_east << nfc_north << nfc_south << nfc_west

TeamGroup.create({ full_name: 'National Football League', short_name: 'NFL'}).teams << afc_east << afc_north << afc_south << afc_west << nfc_east << nfc_north << nfc_south << nfc_west

						          

# MLB Teams
# TODO

# NHL Teams
Team.create([{ full_name: 'Anaheim Ducks', location: 'Anaheim', nickname: 'Ducks' },
						 { full_name: 'Calgary Flames', location: 'Calgary', nickname: 'Flames' },
						 { full_name: 'Edmonton Oilers', location: 'Edmonton', nickname: 'Oilers' },
						 { full_name: 'Los Angeles Kings', location: 'Los Angeles', nickname: 'Kings' },
						 { full_name: 'Phoenix Coyotes', location: 'Phoenix', nickname: 'Coyotes' },
						 { full_name: 'San Jone Sharks', location: 'San Jose', nickname: 'Sharks' },
						 { full_name: 'Vancouver Canucks', location: 'Vancouver', nickname: 'Canucks' },

						 { full_name: 'Chicago Blackhawks', location: 'Chicago', nickname: 'Blackhawks' },
						 { full_name: 'Colorado Avalanche', location: 'Colorado', nickname: 'Avalanche' },
						 { full_name: 'Dallas Stars', location: 'Dallas', nickname: 'Stars' },
						 { full_name: 'Minnesota Wild', location: 'Minnesota', nickname: 'Wild' },
						 { full_name: 'Nashville Predators', location: 'Nashville', nickname: 'Predators' },
						 { full_name: 'St. Louis Blues', location: 'St. Louis', nickname: 'Blues' },
						 { full_name: 'Winnipeg Jets', location: 'Winnipeg', nickname: 'Jets' },

						 { full_name: 'Boston Bruins', location: 'Boston', nickname: 'Bruins' },
						 { full_name: 'Buffalo Sabres', location: 'Buffalo', nickname: 'Sabres' },
						 { full_name: 'Detroit Red Wings', location: 'Detroit', nickname: 'Red Wings' },
						 { full_name: 'Florida Panthers', location: 'Florida', nickname: 'Panthers' },
						 { full_name: 'Montreal Canadiens', location: 'Montreal', nickname: 'Canadiens' },
						 { full_name: 'Ottawa Senators', location: 'Ottawa', nickname: 'Senators' },
						 { full_name: 'Tampa Bay Lightning', location: 'Tampa Bay', nickname: 'Lightning' },
						 { full_name: 'Toronto Maple Leafs', location: 'Toronto', nickname: 'Maple Leafs' },

						 { full_name: 'Carolina Hurricanes', location: 'Carolina', nickname: 'Hurricanes' },
						 { full_name: 'Columbus Blue Jackets', location: 'Columbus', nickname: 'Blue Jackets' },
						 { full_name: 'New Jersey Devils', location: 'New Jersey', nickname: 'Devils' },
						 { full_name: 'New York Islanders', location: 'New York', nickname: 'Islanders' },
						 { full_name: 'New York Rangers', location: 'New York', nickname: 'Rangers' },
						 { full_name: 'Philadelphia Flyers', location: 'Philadelphia', nickname: 'Flyers' },
						 { full_name: 'Pittsburgh Penguins', location: 'Pittsburgh', nickname: 'Penguins' },
						 { full_name: 'Washington Capitals', location: 'Washington', nickname: 'Capitals' },

	          ])

# NBA Teams
# TODO