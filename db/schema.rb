# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_07_20_010159) do
  create_table "matchups", force: :cascade do |t|
    t.integer "home_team_id", null: false
    t.integer "away_team_id", null: false
    t.integer "week"
    t.integer "year"
    t.decimal "home_score"
    t.decimal "away_score"
    t.integer "winner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["away_team_id"], name: "index_matchups_on_away_team_id"
    t.index ["home_team_id"], name: "index_matchups_on_home_team_id"
    t.index ["winner_id"], name: "index_matchups_on_winner_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "position"
    t.integer "team_id", null: false
    t.string "yahoo_player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "owner"
    t.string "yahoo_team_id"
    t.integer "wins"
    t.integer "losses"
    t.integer "ties"
    t.decimal "points_for"
    t.decimal "points_against"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weekly_newsletters", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "published_at"
    t.integer "week"
    t.integer "year"
    t.boolean "featured"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "matchups", "teams", column: "away_team_id"
  add_foreign_key "matchups", "teams", column: "home_team_id"
  add_foreign_key "matchups", "teams", column: "winner_id"
  add_foreign_key "players", "teams"
end
