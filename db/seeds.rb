# Clear existing data
puts "Clearing existing data..."
WeeklyNewsletter.destroy_all
Matchup.destroy_all
Player.destroy_all
Team.destroy_all

# Create Teams
puts "Creating teams..."
teams = [
  { name: "The Gridiron Gurus", owner: "Mike Johnson", yahoo_team_id: "1", wins: 8, losses: 3, ties: 0, points_for: 1250.5, points_against: 1180.2 },
  { name: "Touchdown Titans", owner: "Sarah Williams", yahoo_team_id: "2", wins: 7, losses: 4, ties: 0, points_for: 1220.8, points_against: 1150.6 },
  { name: "Fantasy Football Fanatics", owner: "David Chen", yahoo_team_id: "3", wins: 6, losses: 5, ties: 0, points_for: 1180.3, points_against: 1200.1 },
  { name: "The End Zone Elite", owner: "Emily Rodriguez", yahoo_team_id: "4", wins: 6, losses: 5, ties: 0, points_for: 1160.7, points_against: 1190.4 },
  { name: "Pigskin Pros", owner: "James Thompson", yahoo_team_id: "5", wins: 5, losses: 6, ties: 0, points_for: 1140.2, points_against: 1210.8 },
  { name: "The Red Zone Raiders", owner: "Lisa Anderson", yahoo_team_id: "6", wins: 5, losses: 6, ties: 0, points_for: 1120.9, points_against: 1230.5 },
  { name: "Fantasy Football Fools", owner: "Robert Martinez", yahoo_team_id: "7", wins: 4, losses: 7, ties: 0, points_for: 1100.4, points_against: 1250.3 },
  { name: "The Hail Mary Heroes", owner: "Jennifer Lee", yahoo_team_id: "8", wins: 4, losses: 7, ties: 0, points_for: 1080.6, points_against: 1270.1 },
  { name: "Gridiron Gladiators", owner: "Michael Brown", yahoo_team_id: "9", wins: 3, losses: 8, ties: 0, points_for: 1060.8, points_against: 1290.7 },
  { name: "The Fantasy Football Fiasco", owner: "Amanda Davis", yahoo_team_id: "10", wins: 3, losses: 8, ties: 0, points_for: 1040.3, points_against: 1310.2 },
  { name: "Touchdown Troubles", owner: "Christopher Wilson", yahoo_team_id: "11", wins: 2, losses: 9, ties: 0, points_for: 1020.5, points_against: 1330.9 },
  { name: "The Last Place Losers", owner: "Jessica Taylor", yahoo_team_id: "12", wins: 1, losses: 10, ties: 0, points_for: 1000.1, points_against: 1350.6 }
]

teams.each do |team_data|
  Team.create!(team_data)
end

# Create Weekly Newsletters
puts "Creating newsletters..."
newsletters = [
  {
    title: "Week 11: The Playoff Race Heats Up! 🔥",
    content: "What a week it was in our fantasy football league! The playoff race is tighter than a pair of skinny jeans on Thanksgiving. Mike's Gridiron Gurus continue to dominate, but Sarah's Touchdown Titans are breathing down his neck like a defensive end on a quarterback.\n\nThis week's biggest surprise? The Last Place Losers actually scored more than 100 points! I know, I'm as shocked as you are. Jessica must have finally figured out how to set her lineup properly.\n\nQuote of the Week: 'I'm not saying I'm the best fantasy football player, but I'm definitely in the top 10... of this league.' - David Chen, who is currently in 3rd place.\n\nTrash Talk Corner:\n- Mike to Sarah: 'Your team is like a broken clock - right twice a day.'\n- Sarah to Mike: 'At least my clock works more than your running backs.'\n\nLooking ahead to Week 12, we have some epic matchups that could shake up the standings. The battle for the 6th playoff spot is going to be intense!",
    published_at: 1.week.ago,
    week: 11,
    year: 2024,
    featured: true
  },
  {
    title: "Week 10: Upsets Galore! 😱",
    content: "If you thought last week was crazy, you haven't seen anything yet! Week 10 brought us more upsets than a toddler at a tea party. The Fantasy Football Fools actually beat the Gridiron Gurus! Robert Martinez is probably still celebrating.\n\nBiggest Loser of the Week: The Hail Mary Heroes, who managed to score a whopping 67.3 points. Jennifer, I think your team needs more than just prayers.\n\nPlayer of the Week: Christian McCaffrey, who single-handedly carried The End Zone Elite to victory. Emily owes him a steak dinner.\n\nFun Fact: This is the first time in league history that the last place team has beaten the first place team. Jessica, you're making history!\n\nNext week's predictions: More chaos, more trash talk, and probably more injuries that will ruin everyone's season.",
    published_at: 2.weeks.ago,
    week: 10,
    year: 2024,
    featured: false
  },
  {
    title: "Week 9: The Midseason Report 📊",
    content: "We're officially past the halfway point of the season, and boy, what a ride it's been! Let's take a look at who's hot, who's not, and who should probably just give up.\n\nHot: Mike Johnson's Gridiron Gurus - 7-2 record and looking unstoppable\nNot: Jessica Taylor's Last Place Losers - 0-9 and looking... well, like losers\n\nMost Improved: David Chen's Fantasy Football Fanatics, who have won 4 straight\nMost Disappointing: James Thompson's Pigskin Pros, who started 4-1 but are now 4-5\n\nTrade Deadline is approaching, and I expect some desperate moves from teams on the bubble. Remember, folks, sometimes the best trade is no trade at all.\n\nQuote of the Week: 'I'm not tanking, I'm strategically positioning myself for next year's draft.' - Christopher Wilson, who is definitely tanking.",
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
