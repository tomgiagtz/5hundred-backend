# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create(username: 'User 1', password: 'password')


team1 = Team.create(name: 'Team 1', player1: 'player1', player2: 'player2')
team2 = Team.create(name: 'Team 2', player1: 'player3', player2: 'player4')

matchup = Matchup.create()
team_matchup = TeamMatchup.create(matchup: matchup, team: team1)
team_matchup = TeamMatchup.create(matchup: matchup, team: team2)

game = Game.create(user: u1, matchup: matchup)

# should errror
# team_matchup = TeamMatchup.create(matchup: matchup, team: team2)


round1 = Round.create(game_id: game.id, dealer: team1.player1, team_1_points_earned: 30, team_2_points_earned: 80)
#pass team2.player1
round1_bid1 = Bid.create(round_id: round1.id, team_id: team1.id, suit: 0, num_tricks: 6, bidder: team1.player2)
round1_bid2 = Bid.create(round_id: round1.id, team_id: team2.id, suit: 1, num_tricks: 6, bidder: team2.player2)

round2 = Round.create(game_id: game.id, dealer: team2.player1, team_1_points_earned: 100, team_2_points_earned: 20)
round2_bid1 = Bid.create(round_id: round2.id, team_id: team1.id, suit: 0, num_tricks: 6, bidder: team1.player2)
#pass team2.player2
round2_bid1 = Bid.create(round_id: round2.id, team_id: team1.id, suit: 3, num_tricks: 6, bidder: team1.player1)
