class BidSerializer < ActiveModel::Serializer
  attributes :num_tricks, :suit, :score, :team_id, :bidder
  
end
