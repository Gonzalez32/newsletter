class TeamsController < ApplicationController
  def index
    @teams = Team.order(wins: :desc, points_for: :desc)
  end

  def show
    @team = Team.find(params[:id])
    @players = @team.players.order(:position, :name)
    @recent_matchups = Matchup.where("home_team_id = ? OR away_team_id = ?", @team.id, @team.id)
                             .includes(:home_team, :away_team, :winner)
                             .order(year: :desc, week: :desc).limit(5)
  end
end
