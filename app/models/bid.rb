class Bid < ApplicationRecord
	belongs_to :round
	validates_presence_of :round
	validates :num_tricks, presence: true, numericality: {greater_than_or_equal_to: 6, less_than_or_equal_to: 10}
	validates :suit, presence: true, numericality: {greater_than_or_equal_to: -2, less_than_or_equal_to: 4}


	def score
		if self.suit == -1 #mesere
			return 250
		elsif self.suit == -2
			return 500
		else
			addend = (self.num_tricks - 6) * 100
			base_points = 40 + (20 * self.suit)

			return base_points + addend
		end
	end
end
