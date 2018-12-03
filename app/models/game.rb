class Game < ApplicationRecord
	belongs_to :user
	belongs_to :matchup
	has_many :teams, through: :matchup

	has_many :rounds
	has_many :bids, through: :rounds

	accepts_nested_attributes_for :teams

	def winner
		if score[:team1] > 500
			return teams[0]
		elsif score[:team2] > 500
			return teams[1]
		else
			return nil
		end

	end

	def score
		score = {
			team1: 0,
			team2: 0  
		}

		self.rounds.each do |round|
			score[:team1] += round.team_1_points_earned
			score[:team2] += round.team_2_points_earned
		end

		score
	end
end
