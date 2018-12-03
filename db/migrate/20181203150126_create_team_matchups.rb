class CreateTeamMatchups < ActiveRecord::Migration[5.2]
  def change
    create_table :team_matchups do |t|
      t.references :matchup, foreign_key: true
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
