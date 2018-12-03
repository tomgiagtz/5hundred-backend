class CreateRounds < ActiveRecord::Migration[5.2]
  def change
	create_table :rounds do |t|
	  t.integer :team_1_points_earned
	  t.integer :team_2_points_earned
	  t.integer :bidder_tricks_taken
	  t.string :dealer
	  t.boolean :bid_made, presence: true
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
