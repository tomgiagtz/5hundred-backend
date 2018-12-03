class Round < ApplicationRecord
	validates :game_id, presence: true

  	belongs_to :game
	has_many :bids

	accepts_nested_attributes_for :bids

end
