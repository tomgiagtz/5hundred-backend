class CreateTeams < ActiveRecord::Migration[5.2]
  def change
	create_table :teams do |t|
		t.string :name
      	t.string :player1
      	t.string :player2

      t.timestamps
    end
  end
end
