class Matchup < ApplicationRecord

	has_many :games
	has_many :team_matchups
	has_many :teams, through: :team_matchups

	accepts_nested_attributes_for :team_matchups

end
