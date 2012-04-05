# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120402213831) do

  create_table "cards", :force => true do |t|
    t.string   "rank"
    t.string   "suit"
    t.integer  "user_game_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "cards", ["user_game_id"], :name => "index_cards_on_user_game_id"

  create_table "credentials", :force => true do |t|
    t.string   "name"
    t.string   "password"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "credentials", ["user_id"], :name => "index_credentials_on_user_id"

  create_table "games", :force => true do |t|
    t.boolean  "win"
    t.boolean  "lose"
    t.boolean  "tie"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_games", :force => true do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_games", ["game_id"], :name => "index_user_games_on_game_id"
  add_index "user_games", ["user_id"], :name => "index_user_games_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "password"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
