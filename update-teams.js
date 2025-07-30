#!/usr/bin/env node

const fs = require('fs');
const path = require('path');

// Path to your teams data file
const TEAMS_FILE = './assets/data/teams.json';

// Function to calculate win percentage
function calculateWinPercentage(wins, losses, ties) {
  const totalGames = wins + losses + ties;
  if (totalGames === 0) return 0.0;
  return ((wins + (ties * 0.5)) / totalGames * 100).toFixed(1);
}

// Function to update team records
function updateTeamRecords(updates) {
  try {
    // Read current teams data
    const teamsData = JSON.parse(fs.readFileSync(TEAMS_FILE, 'utf8'));
    
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
    
    console.log('✅ Team records updated successfully!');
    console.log('\n📊 Updated Standings:');
    teamsData.teams.forEach((team, index) => {
      console.log(`${index + 1}. ${team.name} (${team.owner}) - ${team.wins}W ${team.losses}L ${team.ties}T - ${team.win_percentage}%`);
    });
    
  } catch (error) {
    console.error('❌ Error updating team records:', error.message);
  }
}

// Example usage - you can modify this weekly
const weeklyUpdates = [
  {
    id: 1,
    wins: 3,
    losses: 2,
    ties: 0,
    points_for: 1250.5,
    points_against: 1100.2
  },
  {
    id: 2,
    wins: 4,
    losses: 1,
    ties: 0,
    points_for: 1180.3,
    points_against: 950.8
  }
  // Add updates for all teams...
];

// Run the update
updateTeamRecords(weeklyUpdates); 