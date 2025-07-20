class MatchupsController < ApplicationController
  def index
    @matchups = Matchup.includes(:home_team, :away_team, :winner)
                       .order(year: :desc, week: :desc)
  end

  def show
    @matchup = Matchup.includes(:home_team, :away_team, :winner).find(params[:id])
  end
end
