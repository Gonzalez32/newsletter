class HomeController < ApplicationController
  def index
    @latest_newsletter = WeeklyNewsletter.order(published_at: :desc).first
    @teams = Team.order(wins: :desc, points_for: :desc).limit(5)
    @total_newsletters = WeeklyNewsletter.count
    @total_teams = Team.count
  end

  def dashboard
    @teams = Team.order(wins: :desc, points_for: :desc)
    @recent_matchups = Matchup.includes(:home_team, :away_team).order(week: :desc, year: :desc).limit(5)
    @latest_newsletter = WeeklyNewsletter.order(published_at: :desc).first
  end

  def about
  end
end
