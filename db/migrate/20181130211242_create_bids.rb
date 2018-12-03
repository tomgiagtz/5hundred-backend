class CreateBids < ActiveRecord::Migration[5.2]
  def change
    create_table :bids do |t|
      t.references :team, foreign_key: true
      t.integer :suit
      t.integer :num_tricks
      t.string :bidder
      t.references :round, foreign_key: true

      t.timestamps
    end
  end
end
