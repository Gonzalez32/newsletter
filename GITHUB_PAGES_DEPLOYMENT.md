# 🚀 GitHub Pages Deployment Guide

This guide will help you deploy your Fantasy Football Newsletter to GitHub Pages with your custom domain `fantasyfootballnewsletter.net`.

## Prerequisites

1. **GitHub Account** - You need a GitHub account
2. **Domain Name** - You already have `fantasyfootballnewsletter.net`
3. **Git** - Installed on your computer

## Step 1: Create GitHub Repository

1. **Go to GitHub** and create a new repository:
   - Repository name: `newsletter` (or whatever you prefer)
   - Make it **Public** (required for free GitHub Pages)
   - Don't initialize with README (we'll push our existing code)

2. **Clone the repository locally:**
   ```bash
   git clone https://github.com/YOUR_USERNAME/newsletter.git
   cd newsletter
   ```

## Step 2: Prepare Your Jekyll Site

1. **Copy all the Jekyll files** we created to your repository:
   - `_config.yml`
   - `Gemfile`
   - `index.html`
   - `_layouts/`
   - `assets/`
   - `teams/`
   - etc.

2. **Update the domain in `_config.yml`:**
   ```yaml
   url: "https://fantasyfootballnewsletter.net"
   ```

3. **Install Jekyll dependencies:**
   ```bash
   bundle install
   ```

4. **Test locally:**
   ```bash
   bundle exec jekyll serve
   ```
   Visit `http://localhost:4000` to see your site

## Step 3: Push to GitHub

1. **Add all files:**
   ```bash
   git add .
   git commit -m "Initial Jekyll site setup"
   git push origin main
   ```

## Step 4: Enable GitHub Pages

1. **Go to your repository on GitHub**
2. **Click Settings** (tab at the top)
3. **Scroll down to "Pages"** (in the left sidebar)
4. **Under "Source":**
   - Select "Deploy from a branch"
   - Choose "main" branch
   - Select "/ (root)" folder
   - Click "Save"

## Step 5: Configure Custom Domain

1. **In the same Pages settings:**
   - Under "Custom domain"
   - Enter: `fantasyfootballnewsletter.net`
   - Check "Enforce HTTPS"
   - Click "Save"

2. **Create a CNAME file:**
   ```bash
   echo "fantasyfootballnewsletter.net" > CNAME
   git add CNAME
   git commit -m "Add custom domain"
   git push origin main
   ```

## Step 6: Configure DNS

1. **Go to your domain registrar** (where you bought `fantasyfootballnewsletter.net`)

2. **Add DNS records:**
   - **Type:** CNAME
   - **Name:** `fantasyfootballnewsletter.net` (or `@`)
   - **Value:** `YOUR_USERNAME.github.io`
   - **TTL:** 3600 (or default)

3. **Alternative - A Records:**
   If CNAME doesn't work, use these A records:
   - **Type:** A
   - **Name:** `fantasyfootballnewsletter.net` (or `@`)
   - **Value:** `185.199.108.153`
   - **Value:** `185.199.109.153`
   - **Value:** `185.199.110.153`
   - **Value:** `185.199.111.153`

## Step 7: Wait for Deployment

1. **GitHub Pages takes 5-10 minutes** to build and deploy
2. **DNS propagation** can take up to 48 hours (usually much faster)
3. **Check deployment status** in the repository's "Actions" tab

## Step 8: Verify Your Site

1. **Visit your domain:** `https://fantasyfootballnewsletter.net`
2. **Check that HTTPS works** (should redirect automatically)
3. **Test all pages** and functionality

## Step 9: Update Your Data

To update your site content:

1. **Edit the JSON files** in `assets/data/`:
   - `teams.json` - Team information
   - `stats.json` - League statistics
   - `latest-newsletter.json` - Latest newsletter
   - `top-teams.json` - Top teams for homepage

2. **Add new newsletters:**
   - Create new files in `_newsletters/` directory
   - Use this format:

```markdown
---
layout: newsletter
title: "Week 9: The Playoff Push Begins!"
published_at: "November 22, 2024"
week: 9
year: 2024
---

Your newsletter content here...
```

3. **Commit and push:**
   ```bash
   git add .
   git commit -m "Update newsletter content"
   git push origin main
   ```

## Step 10: Customize Your Content

### Update Team Data
Edit `assets/data/teams.json` with your actual teams:

```json
{
  "teams": [
    {
      "id": 1,
      "name": "Your Team Name",
      "slug": "your-team-slug",
      "owner": "Your Name",
      "wins": 6,
      "losses": 2,
      "ties": 0,
      "points_for": 1250.5,
      "points_against": 1100.2,
      "win_percentage": 75.0
    }
  ]
}
```

### Add Newsletters
Create files in `_newsletters/` directory:

```markdown
---
layout: newsletter
title: "Week 10: Championship Dreams"
published_at: "November 29, 2024"
week: 10
year: 2024
---

Your hilarious newsletter content goes here...
```

## Troubleshooting

### Common Issues

1. **Site not loading:**
   - Check DNS propagation: `nslookup fantasyfootballnewsletter.net`
   - Verify GitHub Pages is enabled
   - Check repository is public

2. **HTTPS not working:**
   - Wait for SSL certificate (can take up to 24 hours)
   - Check "Enforce HTTPS" is enabled in Pages settings

3. **Build errors:**
   - Check the "Actions" tab for build logs
   - Verify Jekyll syntax in your files
   - Test locally with `bundle exec jekyll serve`

4. **Domain not working:**
   - Verify CNAME file exists in repository
   - Check DNS records are correct
   - Wait for DNS propagation

### Useful Commands

```bash
# Test site locally
bundle exec jekyll serve

# Build site for production
bundle exec jekyll build

# Check for build errors
bundle exec jekyll build --verbose

# Update dependencies
bundle update
```

## Next Steps

1. **Add your real data** to the JSON files
2. **Create your first newsletter** in the `_newsletters/` directory
3. **Customize the design** by editing `assets/css/main.scss`
4. **Add more pages** as needed
5. **Set up automatic updates** from your fantasy football platform

## Benefits of This Setup

✅ **Free hosting** with GitHub Pages  
✅ **Custom domain** with SSL certificate  
✅ **Fast loading** static site  
✅ **Easy updates** via Git  
✅ **Mobile responsive** design  
✅ **SEO optimized** with Jekyll  

---

**Your site will be live at `https://fantasyfootballnewsletter.net`! 🎉** 