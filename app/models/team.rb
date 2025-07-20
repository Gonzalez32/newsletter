class Team < ApplicationRecord
  has_many :home_matchups, class_name: 'Matchup', foreign_key: 'home_team_id'
  has_many :away_matchups, class_name: 'Matchup', foreign_key: 'away_team_id'
  has_many :matchup_wins, class_name: 'Matchup', foreign_key: 'winner_id'
  has_many :players, dependent: :destroy

  def all_matchups
    home_matchups + away_matchups
  end

  def win_percentage
    total_games = self.wins + self.losses + self.ties
    return 0.0 if total_games.zero?
    (self.wins.to_f / total_games * 100).round(1)
  end
end
