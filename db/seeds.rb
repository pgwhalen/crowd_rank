# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# NFL Teams
afc_east = Team.create([{ full_name: 'Buffalo Bills', location: 'Buffalo', nickname: 'Saints', primary_color: '#00133F', secondary_color: 'EE2F2B' },
												{ full_name: 'Miami Dolphins', location: 'Miami', nickname: 'Dolphins', primary_color: '#006B79', secondary_color: '#FF642A' },
												{ full_name: 'New England Patriots', location: 'New England', nickname: 'Patriots', primary_color: '#00295B', secondary_color: '#EE2F2B' },
												{ full_name: 'New York Jets', location: 'New York', nickname: 'Jets', primary_color: '#174032', secondary_color: '#FFFFFF' }])

afc_north = Team.create([{ full_name: 'Baltimore Ravens', location: 'Baltimore', nickname: 'Ravens', primary_color: '#2B025B', secondary_color: '#F5A329' },
												 { full_name: 'Cincinnati Bengals', location: 'Cincinnati', nickname: 'Bengals', primary_color: '#FF2700', secondary_color: '#101B24' },
												 { full_name: 'Cleveland Browns', location: 'Cleveland', nickname: 'Browns', primary_color: '#4C230E', secondary_color: '#FF652B' },
												 { full_name: 'Pittsburgh Steelers', location: 'Pittsburgh', nickname: 'Steelers', primary_color: '#000000', secondary_color: '#FFBF00' }])

afc_south = Team.create([{ full_name: 'Houston Texans', location: 'Houston', nickname: 'Texans', primary_color: '#00133F', secondary_color: '#D6303A' },
												 { full_name: 'Indianapolis Colts', location: 'Indianapolis', nickname: 'Colts', primary_color: '#00417E', secondary_color: '#FFFFFF' },
												 { full_name: 'Jacksonville Jaguars', location: 'Jacksonville', nickname: 'Jaguars', primary_color: '#00839C', secondary_color: '#101B24' },
												 { full_name: 'Tennessee Titans', location: 'Tennessee', nickname: 'Titans', primary_color: '#002C4B', secondary_color: '#EE2F2B' }])

afc_west = Team.create([{ full_name: 'Denver Broncos', location: 'Denver', nickname: 'Broncos', primary_color: '#002E4D', secondary_color: '#FF652B' },
											  { full_name: 'Kansas City Chiefs', location: 'Kansas City', nickname: 'Chiefs', primary_color: '#C60024', secondary_color: '#000000' },
											  { full_name: 'Oakland Raiders', location: 'Oakland', nickname: 'Raiders', primary_color: '#000000', secondary_color: '#B5BBBD' },
											  { full_name: 'San Diego Chargers', location: 'San Diego', nickname: 'Chargers', primary_color: '#05173C', secondary_color: '#0F83B8' }])

nfc_east = Team.create([{ full_name: 'Dallas Cowboys', location: 'Dallas', nickname: 'Cowboys', primary_color: '#002E4D', secondary_color: '#FFFFFF' },
											  { full_name: 'New York Giants', location: 'New York', nickname: 'Giants', primary_color: '#003155', secondary_color: '#FFFFFF' },
											  { full_name: 'Philadelphia Eagles', location: 'Philadelphia', nickname: 'Eagles', primary_color: '#002F30', secondary_color: '#EFEFEF' },
											  { full_name: 'Washington Redskins', location: 'Washington', nickname: 'Redskins', primary_color: '#8C001A', secondary_color: '#FFBF00' }])

nfc_north = Team.create([{ full_name: 'Chicago Bears', location: 'Chicago', nickname: 'Bears', primary_color: '#00133F', secondary_color: '#FF652B' },						 
												 { full_name: 'Detroit Lions', location: 'Detroit', nickname: 'Lions', primary_color: '#006EA1', secondary_color: '#F6F6F6' },
												 { full_name: 'Green Bay Packers', location: 'Green Bay', nickname: 'Packers', primary_color: '#294239', secondary_color: '#FFBF00' },
												 { full_name: 'Minnesota Vikings', location: 'Minnesota', nickname: 'Vikings', primary_color: '#240A67', secondary_color: '#FFAC2C' }])

nfc_south = Team.create([{ full_name: 'Atlanta Falcons', location: 'Atlanta', nickname: 'Falcons', primary_color: '#000000', secondary_color: '#231F20' },
												 { full_name: 'Carolina Panthers', location: 'Carolina', nickname: 'Panthers', primary_color: '#0097C6', secondary_color: '#101B24' },
												 { full_name: 'New Orleans Saints', location: 'New Orleans', nickname: 'Saints', primary_color: '#C6A876', secondary_color: '#000B17' },
												 { full_name: 'Tampa Bay Buccaneers', location: 'Tampa Bay', nickname: 'Buccaneers', primary_color: '#665C50', secondary_color: '#D6303A' }])

nfc_west = Team.create([{ full_name: 'Arizona Cardinals', location: 'Arizona', nickname: 'Cardinals', primary_color: '#B10339', secondary_color: '#FFC40D' },
											  { full_name: 'St. Louis Rams', location: 'St. Louis', nickname: 'Rams', primary_color: '#00295B', secondary_color: '#C1A05B' },
											  { full_name: 'San Fransisco 49ers', location: 'San Fransisco', nickname: '49ers', primary_color: '#940029', secondary_color: '#D99E77' },
											  { full_name: 'Seattle Seahawks', location: 'Seattle', nickname: 'Seahawks', primary_color: '#030F1F', secondary_color: '#283E67' }])

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

TeamGroup.create({ full_name: 'National Football League', short_name: 'NFL', top_level: true}).teams << afc_east << afc_north << afc_south << afc_west << nfc_east << nfc_north << nfc_south << nfc_west

						          

# MLB Teams
# TODO

# NHL Teams
pacific = Team.create([{ full_name: 'Anaheim Ducks', location: 'Anaheim', nickname: 'Ducks' },
						 					 { full_name: 'Calgary Flames', location: 'Calgary', nickname: 'Flames' },
						 					 { full_name: 'Edmonton Oilers', location: 'Edmonton', nickname: 'Oilers' },
						 					 { full_name: 'Los Angeles Kings', location: 'Los Angeles', nickname: 'Kings' },
						 					 { full_name: 'Phoenix Coyotes', location: 'Phoenix', nickname: 'Coyotes' },
						 					 { full_name: 'San Jone Sharks', location: 'San Jose', nickname: 'Sharks' },
						 					 { full_name: 'Vancouver Canucks', location: 'Vancouver', nickname: 'Canucks' }])

central = Team.create([{ full_name: 'Chicago Blackhawks', location: 'Chicago', nickname: 'Blackhawks' },
						 					 { full_name: 'Colorado Avalanche', location: 'Colorado', nickname: 'Avalanche' },
						 					 { full_name: 'Dallas Stars', location: 'Dallas', nickname: 'Stars' },
						 					 { full_name: 'Minnesota Wild', location: 'Minnesota', nickname: 'Wild' },
						 					 { full_name: 'Nashville Predators', location: 'Nashville', nickname: 'Predators' },
						 					 { full_name: 'St. Louis Blues', location: 'St. Louis', nickname: 'Blues' },
						 					 { full_name: 'Winnipeg Jets', location: 'Winnipeg', nickname: 'Jets' }])

atlantic = Team.create([{ full_name: 'Boston Bruins', location: 'Boston', nickname: 'Bruins' },
						 						{ full_name: 'Buffalo Sabres', location: 'Buffalo', nickname: 'Sabres' },
						 						{ full_name: 'Detroit Red Wings', location: 'Detroit', nickname: 'Red Wings' },
						 						{ full_name: 'Florida Panthers', location: 'Florida', nickname: 'Panthers' },
						 						{ full_name: 'Montreal Canadiens', location: 'Montreal', nickname: 'Canadiens' },
						 						{ full_name: 'Ottawa Senators', location: 'Ottawa', nickname: 'Senators' },
						 						{ full_name: 'Tampa Bay Lightning', location: 'Tampa Bay', nickname: 'Lightning' },
						 						{ full_name: 'Toronto Maple Leafs', location: 'Toronto', nickname: 'Maple Leafs' }])

metropolitan = Team.create([{ full_name: 'Carolina Hurricanes', location: 'Carolina', nickname: 'Hurricanes' },
						 								{ full_name: 'Columbus Blue Jackets', location: 'Columbus', nickname: 'Blue Jackets' },
						 								{ full_name: 'New Jersey Devils', location: 'New Jersey', nickname: 'Devils' },
						 								{ full_name: 'New York Islanders', location: 'New York', nickname: 'Islanders' },
						 								{ full_name: 'New York Rangers', location: 'New York', nickname: 'Rangers' },
						 								{ full_name: 'Philadelphia Flyers', location: 'Philadelphia', nickname: 'Flyers' },
						 								{ full_name: 'Pittsburgh Penguins', location: 'Pittsburgh', nickname: 'Penguins' },
														{ full_name: 'Washington Capitals', location: 'Washington', nickname: 'Capitals' }])

TeamGroup.create({ full_name: 'Pacific Division', short_name: "Pacific"}).teams << pacific
TeamGroup.create({ full_name: 'Central Division', short_name: "Central"}).teams << central
TeamGroup.create({ full_name: 'Atlantic Division', short_name: "Atlantic"}).teams << atlantic
TeamGroup.create({ full_name: 'Metropolitan Division', short_name: "Metropolitan"}).teams << metropolitan

TeamGroup.create({ full_name: 'Western Conference', short_name: "West"}).teams << pacific << central
TeamGroup.create({ full_name: 'Eastern Conference', short_name: "East"}).teams << atlantic << metropolitan

TeamGroup.create({ full_name: 'National Hockey Leauge', short_name: "NHL", top_level: true}).teams << pacific << central << atlantic << metropolitan

# NBA Teams
# TODO