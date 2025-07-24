# Clear existing data
puts "Clearing existing data..."
WeeklyNewsletter.destroy_all
Matchup.destroy_all
Player.destroy_all
Team.destroy_all

# Create Teams
puts "Creating teams..."
teams = [
  { name: "Unlucky Carrot Team 🥕", owner: "Juan Jr (League Commissioner)", yahoo_team_id: "1", wins: 0, losses: 0, ties: 0, points_for: 0, points_against: 0 },
  { name: "Taqueria chorizon 🌮", owner: "Lalo", yahoo_team_id: "2", wins: 0, losses: 0, ties: 0, points_for: 0, points_against: 0 },
  { name: "Big D(rive) Energy", owner: "Haley", yahoo_team_id: "3", wins: 0, losses: 0, ties: 0, points_for: 0, points_against: 0 },
  { name: "Climb Up Maral", owner: "Maral", yahoo_team_id: "4", wins: 0, losses: 0, ties: 0, points_for: 0, points_against: 0 },
  { name: "Locked In Christopher F", owner: "Christopher F", yahoo_team_id: "5", wins: 0, losses: 0, ties: 0, points_for: 0, points_against: 0 },
  { name: "Sticky Carlos", owner: "Carlos", yahoo_team_id: "6", wins: 0, losses: 0, ties: 0, points_for: 0, points_against: 0 },
  { name: "I am Vengeance", owner: "Hector", yahoo_team_id: "7", wins: 0, losses: 0, ties: 0, points_for: 0, points_against: 0 },
  { name: "Salud mija", owner: "Jesus", yahoo_team_id: "8", wins: 0, losses: 0, ties: 0, points_for: 0, points_against: 0 },
  { name: "The Ax-man", owner: "Axel", yahoo_team_id: "9", wins: 0, losses: 0, ties: 0, points_for: 0, points_against: 0 },
  { name: "Los Mapaches", owner: "Julian", yahoo_team_id: "10", wins: 0, losses: 0, ties: 0, points_for: 0, points_against: 0 },
  { name: "Slippery Toy", owner: "Toy", yahoo_team_id: "11", wins: 0, losses: 0, ties: 0, points_for: 0, points_against: 0 },
  { name: "Mic'd Up Patrick Janak", owner: "Patrick Janak", yahoo_team_id: "12", wins: 0, losses: 0, ties: 0, points_for: 0, points_against: 0 },
  { name: "Juan's Pancakes", owner: "Juan", yahoo_team_id: "13", wins: 0, losses: 0, ties: 0, points_for: 0, points_against: 0 },
  { name: "Chief City Supermen", owner: "Angel", yahoo_team_id: "14", wins: 0, losses: 0, ties: 0, points_for: 0, points_against: 0 }
]

teams.each do |team_data|
  Team.create!(team_data)
end

# No newsletters created yet - season hasn't started
puts "No newsletters created yet - season starts soon!"

# No matchups yet - season hasn't started
puts "No matchups created yet - season starts soon!"

# Create some sample players
puts "Creating players..."
team_objects = Team.all.to_a

players = [
  { name: "Christian McCaffrey", position: "RB", team: team_objects[3], yahoo_player_id: "cmc" },
  { name: "Tyreek Hill", position: "WR", team: team_objects[0], yahoo_player_id: "thill" },
  { name: "Patrick Mahomes", position: "QB", team: team_objects[1], yahoo_player_id: "pmahomes" },
  { name: "Travis Kelce", position: "TE", team: team_objects[2], yahoo_player_id: "tkelce" },
  { name: "Austin Ekeler", position: "RB", team: team_objects[4], yahoo_player_id: "aekeler" },
  { name: "Stefon Diggs", position: "WR", team: team_objects[5], yahoo_player_id: "sdiggs" }
]

players.each do |player_data|
  Player.create!(player_data)
end

puts "Seed data created successfully!"
puts "Created #{Team.count} teams"
puts "Created #{WeeklyNewsletter.count} newsletters"
puts "Created #{Matchup.count} matchups"
puts "Created #{Player.count} players"
