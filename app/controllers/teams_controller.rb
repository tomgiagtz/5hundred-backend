class TeamsController < ApplicationController
	def create
		render json: Team.create(team_params)
	end

	def index
		render json: Team.all
	end
	private
		def team_params
			params.require(:team).permit(:name, :player1, :player2)
		end
end
