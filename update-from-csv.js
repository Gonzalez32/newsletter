#!/usr/bin/env node

const fs = require('fs');
const csv = require('csv-parser');

// Path to your files
const TEAMS_FILE = './assets/data/teams.json';
const CSV_FILE = './weekly-update.csv'; // You'll create this weekly

// Function to calculate win percentage
function calculateWinPercentage(wins, losses, ties) {
  const totalGames = wins + losses + ties;
  if (totalGames === 0) return 0.0;
  return ((wins + (ties * 0.5)) / totalGames * 100).toFixed(1);
}

// Function to update from CSV
function updateFromCSV() {
  try {
    // Read current teams data
    const teamsData = JSON.parse(fs.readFileSync(TEAMS_FILE, 'utf8'));
    const updates = [];
    
    // Read CSV file
    fs.createReadStream(CSV_FILE)
      .pipe(csv())
      .on('data', (row) => {
        updates.push({
          id: parseInt(row.id),
          wins: parseInt(row.wins),
          losses: parseInt(row.losses),
          ties: parseInt(row.ties),
          points_for: parseFloat(row.points_for),
          points_against: parseFloat(row.points_against)
        });
      })
      .on('end', () => {
        // Update each team
        updates.forEach(update => {
          const team = teamsData.teams.find(t => t.id === update.id);
          if (team) {
            team.wins = update.wins;
            team.losses = update.losses;
            team.ties = update.ties;
            team.points_for = update.points_for;
            team.points_against = update.points_against;
            team.win_percentage = parseFloat(calculateWinPercentage(update.wins, update.losses, update.ties));
          }
        });
        
        // Sort teams by wins (descending)
        teamsData.teams.sort((a, b) => b.wins - a.wins);
        
        // Write updated data back to file
        fs.writeFileSync(TEAMS_FILE, JSON.stringify(teamsData, null, 2));
        
        console.log('✅ Team records updated from CSV successfully!');
        console.log('\n📊 Updated Standings:');
        teamsData.teams.forEach((team, index) => {
          console.log(`${index + 1}. ${team.name} (${team.owner}) - ${team.wins}W ${team.losses}L ${team.ties}T - ${team.win_percentage}%`);
        });
      });
      
  } catch (error) {
    console.error('❌ Error updating team records:', error.message);
  }
}

// Run the update
updateFromCSV(); 