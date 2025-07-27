#!/bin/bash

# GitHub Pages Setup Script for Fantasy Football Newsletter
# This script helps you set up your Jekyll site for GitHub Pages deployment

set -e

echo "🚀 GitHub Pages Setup for Fantasy Football Newsletter"
echo "=================================================="
echo ""

# Check if we're in the right directory
if [ ! -f "_config.yml" ]; then
    echo "❌ Error: Please run this script from the root of your Jekyll site"
    exit 1
fi

# Get GitHub username
echo "📝 Please enter your GitHub username:"
read -r GITHUB_USERNAME

if [ -z "$GITHUB_USERNAME" ]; then
    echo "❌ Error: GitHub username is required"
    exit 1
fi

# Get repository name
echo "📝 Please enter your repository name (e.g., newsletter):"
read -r REPO_NAME

if [ -z "$REPO_NAME" ]; then
    echo "❌ Error: Repository name is required"
    exit 1
fi

echo ""
echo "🔧 Setting up GitHub Pages deployment..."

# Create CNAME file
echo "fantasyfootballnewsletter.net" > CNAME

# Update _config.yml with correct URL
sed -i.bak "s|url: \".*\"|url: \"https://fantasyfootballnewsletter.net\"|g" _config.yml

# Remove backup file
rm -f _config.yml.bak

# Create .gitignore
cat > .gitignore << EOF
_site/
.sass-cache/
.jekyll-cache/
.jekyll-metadata
vendor/
.bundle/
*.log
.DS_Store
EOF

# Create README.md
cat > README.md << EOF
# 🏈 Fantasy Football Newsletter

A beautiful, modern website for managing and displaying fantasy football league newsletters, standings, matchups, and player statistics.

## 🌐 Live Site

Visit: [https://fantasyfootballnewsletter.net](https://fantasyfootballnewsletter.net)

## 🚀 Features

- **📰 Weekly Newsletter Archive** - Store and display your funny weekly newsletters
- **🏆 League Standings** - Real-time team rankings and statistics
- **⚔️ Matchup Tracking** - Complete game history with scores and results
- **🏃 Player Management** - Roster tracking and player statistics
- **📊 Dashboard** - Comprehensive league overview and quick stats
- **📱 Responsive Design** - Works perfectly on desktop, tablet, and mobile
- **🎨 Beautiful UI** - Modern design with Bulma CSS framework

## 🛠 Tech Stack

- **Static Site Generator:** Jekyll
- **Frontend:** Bulma CSS Framework
- **Hosting:** GitHub Pages
- **Domain:** Custom domain with SSL

## 📝 How to Update

1. **Edit JSON files** in \`assets/data/\` to update team and league data
2. **Add newsletters** by creating new files in \`_newsletters/\` directory
3. **Commit and push** changes to GitHub
4. **GitHub Pages** will automatically rebuild and deploy

## 🎯 Quick Start

\`\`\`bash
# Clone the repository
git clone https://github.com/${GITHUB_USERNAME}/${REPO_NAME}.git
cd ${REPO_NAME}

# Install dependencies
bundle install

# Run locally
bundle exec jekyll serve

# Visit http://localhost:4000
\`\`\`

## 📖 Documentation

For detailed setup instructions, see [GITHUB_PAGES_DEPLOYMENT.md](GITHUB_PAGES_DEPLOYMENT.md)

---

**Built with ❤️ and 🏈 for fantasy football enthusiasts everywhere!**
EOF

echo "✅ Setup completed successfully!"
echo ""

echo "📋 Next Steps:"
echo "=============="
echo ""
echo "1. 🗂️  Create GitHub repository:"
echo "   - Go to: https://github.com/new"
echo "   - Repository name: ${REPO_NAME}"
echo "   - Make it PUBLIC (required for free GitHub Pages)"
echo ""
echo "2. 📤 Push to GitHub:"
echo "   git init"
echo "   git add ."
echo "   git commit -m 'Initial Jekyll site setup'"
echo "   git branch -M main"
echo "   git remote add origin https://github.com/${GITHUB_USERNAME}/${REPO_NAME}.git"
echo "   git push -u origin main"
echo ""
echo "3. ⚙️  Enable GitHub Pages:"
echo "   - Go to repository Settings → Pages"
echo "   - Source: Deploy from a branch"
echo "   - Branch: main, folder: / (root)"
echo "   - Custom domain: fantasyfootballnewsletter.net"
echo "   - Check 'Enforce HTTPS'"
echo ""
echo "4. 🌐 Configure DNS:"
echo "   - Add CNAME record: fantasyfootballnewsletter.net → ${GITHUB_USERNAME}.github.io"
echo "   - Or A records pointing to GitHub Pages IPs"
echo ""
echo "5. ⏳ Wait for deployment:"
echo "   - GitHub Pages: 5-10 minutes"
echo "   - DNS propagation: up to 48 hours"
echo ""
echo "6. ✅ Test your site:"
echo "   - Visit: https://fantasyfootballnewsletter.net"
echo ""
echo "📖 For detailed instructions, see GITHUB_PAGES_DEPLOYMENT.md"
echo ""
echo "🎉 Good luck with your deployment!" 