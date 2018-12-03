class GameSerializer < ActiveModel::Serializer
  attributes :id, :teams, :rounds, :score, :winner

  has_many :teams, through: :matchups
  
  has_many :rounds
end
