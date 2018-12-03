# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_12_03_150126) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bids", force: :cascade do |t|
    t.bigint "team_id"
    t.integer "suit"
    t.integer "num_tricks"
    t.string "bidder"
    t.bigint "round_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["round_id"], name: "index_bids_on_round_id"
    t.index ["team_id"], name: "index_bids_on_team_id"
  end

  create_table "games", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "matchup_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["matchup_id"], name: "index_games_on_matchup_id"
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "matchups", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rounds", force: :cascade do |t|
    t.integer "team_1_points_earned"
    t.integer "team_2_points_earned"
    t.integer "bidder_tricks_taken"
    t.string "dealer"
    t.bigint "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_rounds_on_game_id"
  end

  create_table "team_matchups", force: :cascade do |t|
    t.bigint "matchup_id"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["matchup_id"], name: "index_team_matchups_on_matchup_id"
    t.index ["team_id"], name: "index_team_matchups_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "player1"
    t.string "player2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bids", "rounds"
  add_foreign_key "bids", "teams"
  add_foreign_key "games", "matchups"
  add_foreign_key "games", "users"
  add_foreign_key "rounds", "games"
  add_foreign_key "team_matchups", "matchups"
  add_foreign_key "team_matchups", "teams"
end
