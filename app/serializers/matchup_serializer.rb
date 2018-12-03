class MatchupSerializer < ActiveModel::Serializer
  attributes :id, :team1, :team2
  has_one :game
end
