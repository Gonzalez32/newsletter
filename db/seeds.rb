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

# Create Weekly Newsletters
puts "Creating newsletters..."
newsletters = [
  {
    title: "Welcome to the 2024 Fantasy Football Season! 🏈",
    content: "Welcome to our fantasy football league! The season is about to begin and all 14 teams are ready to battle it out for the championship. Juan Jr's Unlucky Carrot Team 🥕 is looking strong, but Lalo's Taqueria chorizon 🌮 has been making some bold predictions.\n\nThis is a fresh start for everyone - all teams are 0-0 and ready to prove themselves. The draft is complete and the rosters are set. It's anyone's game!\n\nQuote of the Week: 'I'm not saying I'm the best fantasy football player, but I'm definitely in the top 10... of this league.' - Christopher F, setting the bar high early.\n\nTrash Talk Corner:\n- Juan Jr to Lalo: 'Your team is like a broken clock - right twice a day.'\n- Lalo to Juan Jr: 'At least my clock works more than your running backs.'\n\nLooking ahead to Week 1, we have some epic matchups that will set the tone for the entire season. Good luck to all managers!",
    published_at: 1.week.ago,
    week: 1,
    year: 2024,
    featured: true
  },
  {
    title: "Pre-Season Power Rankings 📊",
    content: "With the season about to start, let's take a look at our pre-season power rankings based on draft performance and team composition.\n\nTop Contenders:\n1. Juan Jr's Unlucky Carrot Team 🥕 - Strong RB corps and solid QB play\n2. Lalo's Taqueria chorizon 🌮 - Explosive WR group that could dominate\n3. Christopher F's Locked In Christopher F - Balanced roster with depth\n\nDark Horses:\n- Hector's I am Vengeance - If the stars align, this team could surprise\n- Maral's Climb Up Maral - Rookie manager with potential\n\nTeams to Watch:\n- Toy's Slippery Toy - Could be slippery in a good way or bad way\n- Patrick Janak's Mic'd Up Patrick Janak - Will he live up to the name?\n\nRemember, these rankings mean nothing once the games start. Anything can happen in fantasy football!",
    published_at: 2.weeks.ago,
    week: 0,
    year: 2024,
    featured: false
  },
  {
    title: "Draft Day Recap 🎯",
    content: "The draft is complete and all 14 teams have their rosters set! What a draft it was - full of surprises, reaches, and steals.\n\nDraft Highlights:\n- Juan Jr went RB heavy early, building a strong foundation\n- Lalo's aggressive WR strategy could pay off big time\n- Christopher F played it safe with a balanced approach\n- Hector's 'I am Vengeance' strategy remains mysterious\n\nBiggest Reaches:\n- Toy's Slippery Toy - Some questionable picks that could haunt\n- Patrick Janak's Mic'd Up strategy - Will the mic be on or off?\n\nSteals of the Draft:\n- Maral's Climb Up Maral - Some late round gems\n- Julian's Los Mapaches - Quiet but effective draft\n\nNow it's time to see how these draft strategies play out on the field. The season starts soon and the trash talk is already heating up!",
    published_at: 3.weeks.ago,
    week: 0,
    year: 2024,
    featured: false
  }
]

newsletters.each do |newsletter_data|
  WeeklyNewsletter.create!(newsletter_data)
end

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
