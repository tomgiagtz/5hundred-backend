class Team < ApplicationRecord

	has_many :team_matchups
	has_many :matchups, through: :team_matchups
	has_many :games, through: :matchups
	
	has_many :bids

	validates :name, presense: true
	validates :player1, presense: true
	validates :player2, presense: true

end
