class GamesController < ApplicationController
	def index
		render json: Game.all, include: "*.*"
	end

	def create
		game = Game.new()
		game.user = User.find(game_params[:user_id])
		team1_id = game_params[:teams][:team1_id]
		team2_id = game_params[:teams][:team2_id]
		matchup = game.user.matchups.find do |matchup|
				teams = matchup.teams
				((teams[0].id == team1_id && teams[1].id == team2_id) ||
				(teams[1].id == team2_id && teams[0].id == team2_id))
		end

		if !matchup
			matchup = Matchup.create()
			TeamMatchup.create(matchup: matchup, team: Team.find(team1_id))
			TeamMatchup.create(matchup: matchup, team: Team.find(team2_id))
		end

		puts "WATH"
		game.matchup = matchup
		byebug
		game.save!()
		render json: game
	end

	private 
	def game_params
		params.require(:game).permit(:user_id, teams: [:team1_id, :team2_id])
	end

end
