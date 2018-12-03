class RoundSerializer < ActiveModel::Serializer
  attributes :id, :dealer, :team_1_points_earned, :team_2_points_earned
  has_many :bids
end
