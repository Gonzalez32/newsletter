# Clear existing data
puts "Clearing existing data..."
WeeklyNewsletter.destroy_all
Matchup.destroy_all
Player.destroy_all
Team.destroy_all

# Create Teams
puts "Creating teams..."
teams = [
  { name: "Unlucky Carrot Team 🥕", owner: "Juan Jr (League Commissioner)", yahoo_team_id: "1", wins: 8, losses: 3, ties: 0, points_for: 1250.5, points_against: 1180.2 },
  { name: "Taqueria chorizon 🌮", owner: "Lalo", yahoo_team_id: "2", wins: 7, losses: 4, ties: 0, points_for: 1220.8, points_against: 1150.6 },
  { name: "Big D(rive) Energy", owner: "Haley", yahoo_team_id: "3", wins: 6, losses: 5, ties: 0, points_for: 1180.3, points_against: 1200.1 },
  { name: "Climb Up Maral", owner: "Maral", yahoo_team_id: "4", wins: 6, losses: 5, ties: 0, points_for: 1160.7, points_against: 1190.4 },
  { name: "Locked In Christopher F", owner: "Christopher F", yahoo_team_id: "5", wins: 5, losses: 6, ties: 0, points_for: 1140.2, points_against: 1210.8 },
  { name: "Sticky Carlos", owner: "Carlos", yahoo_team_id: "6", wins: 5, losses: 6, ties: 0, points_for: 1120.9, points_against: 1230.5 },
  { name: "I am Vengeance", owner: "Hector", yahoo_team_id: "7", wins: 4, losses: 7, ties: 0, points_for: 1100.4, points_against: 1250.3 },
  { name: "Salud mija", owner: "Jesus", yahoo_team_id: "8", wins: 4, losses: 7, ties: 0, points_for: 1080.6, points_against: 1270.1 },
  { name: "The Ax-man", owner: "Axel", yahoo_team_id: "9", wins: 3, losses: 8, ties: 0, points_for: 1060.8, points_against: 1290.7 },
  { name: "Los Mapaches", owner: "Julian", yahoo_team_id: "10", wins: 3, losses: 8, ties: 0, points_for: 1040.3, points_against: 1310.2 },
  { name: "Slippery Toy", owner: "Toy", yahoo_team_id: "11", wins: 2, losses: 9, ties: 0, points_for: 1020.5, points_against: 1330.9 },
  { name: "Mic'd Up Patrick Janak", owner: "Patrick Janak", yahoo_team_id: "12", wins: 1, losses: 10, ties: 0, points_for: 1000.1, points_against: 1350.6 },
  { name: "Juan's Pancakes", owner: "Juan", yahoo_team_id: "13", wins: 2, losses: 9, ties: 0, points_for: 1020.5, points_against: 1330.9 },
  { name: "Chief City Supermen", owner: "Angel", yahoo_team_id: "14", wins: 1, losses: 10, ties: 0, points_for: 1000.1, points_against: 1350.6 }
]

teams.each do |team_data|
  Team.create!(team_data)
end

# Create Weekly Newsletters
puts "Creating newsletters..."
newsletters = [
  {
    title: "Week 11: The Playoff Race Heats Up! 🔥",
    content: "What a week it was in our fantasy football league! The playoff race is tighter than a pair of skinny jeans on Thanksgiving. Juan Jr's Unlucky Carrot Team 🥕 continues to dominate, but Lalo's Taqueria chorizon 🌮 is breathing down his neck like a defensive end on a quarterback.\n\nThis week's biggest surprise? Mic'd Up Patrick Janak actually scored more than 100 points! I know, I'm as shocked as you are. Patrick must have finally figured out how to set his lineup properly.\n\nQuote of the Week: 'I'm not saying I'm the best fantasy football player, but I'm definitely in the top 10... of this league.' - Christopher F, who is currently in 3rd place.\n\nTrash Talk Corner:\n- Juan Jr to Lalo: 'Your team is like a broken clock - right twice a day.'\n- Lalo to Juan Jr: 'At least my clock works more than your running backs.'\n\nLooking ahead to Week 12, we have some epic matchups that could shake up the standings. The battle for the 6th playoff spot is going to be intense!",
    published_at: 1.week.ago,
    week: 11,
    year: 2024,
    featured: true
  },
  {
    title: "Week 10: Upsets Galore! 😱",
    content: "If you thought last week was crazy, you haven't seen anything yet! Week 10 brought us more upsets than a toddler at a tea party. I am Vengeance actually beat the Unlucky Carrot Team 🥕! Hector is probably still celebrating.\n\nBiggest Loser of the Week: Salud mija, who managed to score a whopping 67.3 points. Jesus, I think your team needs more than just prayers.\n\nPlayer of the Week: Christian McCaffrey, who single-handedly carried Climb Up Maral to victory. Maral owes him a steak dinner.\n\nFun Fact: This is the first time in league history that the last place team has beaten the first place team. Patrick Janak, you're making history!\n\nNext week's predictions: More chaos, more trash talk, and probably more injuries that will ruin everyone's season.",
    published_at: 2.weeks.ago,
    week: 10,
    year: 2024,
    featured: false
  },
  {
    title: "Week 9: The Midseason Report 📊",
    content: "We're officially past the halfway point of the season, and boy, what a ride it's been! Let's take a look at who's hot, who's not, and who should probably just give up.\n\nHot: Juan Jr's Unlucky Carrot Team 🥕 - 7-2 record and looking unstoppable\nNot: Patrick Janak's Mic'd Up Patrick Janak - 0-9 and looking... well, like losers\n\nMost Improved: Christopher F's Locked In Christopher F, who have won 4 straight\nMost Disappointing: Axel's The Ax-man, who started 4-1 but are now 4-5\n\nTrade Deadline is approaching, and I expect some desperate moves from teams on the bubble. Remember, folks, sometimes the best trade is no trade at all.\n\nQuote of the Week: 'I'm not tanking, I'm strategically positioning myself for next year's draft.' - Toy, who is definitely tanking.",
    published_at: 3.weeks.ago,
    week: 9,
    year: 2024,
    featured: false
  }
]

newsletters.each do |newsletter_data|
  WeeklyNewsletter.create!(newsletter_data)
end

# Create some sample matchups
puts "Creating matchups..."
team_objects = Team.all.to_a

# Create some recent matchups
recent_matchups = [
  { home_team: team_objects[0], away_team: team_objects[1], week: 11, year: 2024, home_score: 125.5, away_score: 118.2, winner: team_objects[0] },
  { home_team: team_objects[2], away_team: team_objects[3], week: 11, year: 2024, home_score: 112.8, away_score: 108.4, winner: team_objects[2] },
  { home_team: team_objects[4], away_team: team_objects[5], week: 11, year: 2024, home_score: 98.7, away_score: 105.3, winner: team_objects[5] },
  { home_team: team_objects[0], away_team: team_objects[6], week: 10, year: 2024, home_score: 95.2, away_score: 102.1, winner: team_objects[6] },
  { home_team: team_objects[1], away_team: team_objects[2], week: 10, year: 2024, home_score: 115.8, away_score: 122.4, winner: team_objects[2] }
]

recent_matchups.each do |matchup_data|
  Matchup.create!(matchup_data)
end

# Create some sample players
puts "Creating players..."
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
