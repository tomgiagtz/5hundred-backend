class RoundsController < ApplicationController
	def create
		round= Round.new(round_params)
		#if round valid and game is not already won
		if !round.game.winner && round.save
			#save sucessful
			render json: round, status: :ok
		elsif round.game.winner
			render status: :method_not_allowed
		else
			#invalid attributes
			render status: :unprocessable_entity
		end
	end

	private
	def round_params
		params.require(:round).permit(:game_id, :dealer, :team_1_points_earned, :team_2_points_earned, bids_attributes: [:num_tricks, :suit, :team_id, :bidder])
	end
end
