# 🏈 Fantasy Football Newsletter

A beautiful, modern website for managing and displaying fantasy football league newsletters, standings, matchups, and player statistics.

## ✨ Features

- **📰 Weekly Newsletter Archive** - Store and display your funny weekly newsletters
- **🏆 League Standings** - Real-time team rankings and statistics
- **⚔️ Matchup Tracking** - Complete game history with scores and results
- **🏃 Player Management** - Roster tracking and player statistics
- **📊 Dashboard** - Comprehensive league overview and quick stats
- **📱 Responsive Design** - Works perfectly on desktop, tablet, and mobile
- **🎨 Beautiful UI** - Modern design with Bulma CSS framework

## 🛠 Tech Stack

- **Backend:** Ruby on Rails 8.0
- **Frontend:** Bulma CSS Framework
- **Database:** SQLite (easily upgradeable to PostgreSQL)
- **Styling:** SCSS with custom football-themed design
- **JavaScript:** Stimulus.js for interactive components

## 🚀 Getting Started

### Prerequisites

- Ruby 3.2.2 or higher
- Node.js 18+ and npm/yarn
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/newsletter.git
   cd newsletter
   ```

2. **Install Ruby dependencies**
   ```bash
   bundle install
   ```

3. **Install Node.js dependencies**
   ```bash
   npm install
   ```

4. **Set up the database**
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

5. **Build CSS assets**
   ```bash
   npm run build:css
   ```

6. **Start the server**
   ```bash
   rails server
   ```

7. **Visit the application**
   Open your browser and go to `http://localhost:3000`

## 📁 Project Structure

```
newsletter/
├── app/
│   ├── controllers/          # Rails controllers
│   ├── models/              # Database models
│   ├── views/               # ERB templates
│   └── assets/              # Stylesheets and images
├── config/                  # Rails configuration
├── db/                      # Database migrations and seeds
├── public/                  # Static files
└── README.md               # This file
```

## 🗄 Database Models

- **WeeklyNewsletter** - Store newsletter content and metadata
- **Team** - League teams with standings and statistics
- **Matchup** - Game results and scores
- **Player** - Player information and team associations

## 🎨 Customization

### Colors and Styling
The application uses a football-themed color scheme with excellent contrast for readability:
- Primary: Dark Blue (`#1e40af`)
- Success: Dark Green (`#059669`)
- Warning: Dark Orange (`#d97706`)
- Danger: Dark Red (`#dc2626`)
- Info: Dark Cyan (`#0891b2`)

### Adding Your Data
1. Update the seed data in `db/seeds.rb` with your league information
2. Import your actual Yahoo Fantasy data
3. Add your real weekly newsletters
4. Customize team names and owner information

## 🚀 Deployment

### Heroku (Recommended)
1. Create a new Heroku app
2. Add PostgreSQL addon
3. Deploy using Git:
   ```bash
   heroku create your-app-name
   heroku addons:create heroku-postgresql
   git push heroku main
   heroku run rails db:migrate
   heroku run rails db:seed
   ```

### Other Platforms
The application can be deployed to any platform that supports Ruby on Rails:
- Railway
- Render
- DigitalOcean App Platform
- AWS Elastic Beanstalk

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Built with [Ruby on Rails](https://rubyonrails.org/)
- Styled with [Bulma CSS](https://bulma.io/)
- Icons from [Emoji](https://emojipedia.org/)

## 📞 Support

If you have any questions or need help with the application, please open an issue on GitHub.

---

**Built with ❤️ and 🏈 for fantasy football enthusiasts everywhere!**
