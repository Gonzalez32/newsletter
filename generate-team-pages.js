#!/usr/bin/env node

const fs = require('fs');
const path = require('path');

// Path to teams data file
const TEAMS_FILE = './assets/data/teams.json';
const TEAMS_DIR = './teams/';

// Function to generate team page content
function generateTeamPage(team) {
  return `---
layout: team
title: "${team.name}"
description: "Team page for ${team.name} - ${team.owner}"
---
`;
}

// Function to generate all team pages
function generateTeamPages() {
  try {
    // Read teams data
    const teamsData = JSON.parse(fs.readFileSync(TEAMS_FILE, 'utf8'));
    
    // Create teams directory if it doesn't exist
    if (!fs.existsSync(TEAMS_DIR)) {
      fs.mkdirSync(TEAMS_DIR, { recursive: true });
    }
    
    // Generate page for each team
    teamsData.teams.forEach(team => {
      const fileName = `${team.slug}.html`;
      const filePath = path.join(TEAMS_DIR, fileName);
      const content = generateTeamPage(team);
      
      fs.writeFileSync(filePath, content);
      console.log(`✅ Created: ${fileName}`);
    });
    
    console.log(`\n🎉 Successfully generated ${teamsData.teams.length} team pages!`);
    console.log('📁 Files created in: ./teams/');
    
  } catch (error) {
    console.error('❌ Error generating team pages:', error.message);
  }
}

// Run the generation
generateTeamPages(); 