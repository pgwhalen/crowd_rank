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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20130922041714) do

  create_table "composite_rankings", force: true do |t|
    t.integer  "team_group_id"
    t.integer  "user_group_id"
    t.datetime "period_start_at"
    t.datetime "period_end_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "composite_ranks", force: true do |t|
    t.integer  "team_id"
    t.integer  "composite_ranking_id"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rankings", force: true do |t|
    t.integer  "user_id"
    t.integer  "team_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ranks", force: true do |t|
    t.integer  "value"
    t.text     "comment"
    t.integer  "ranking_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "team_groups", force: true do |t|
    t.string  "full_name"
    t.string  "short_name"
    t.boolean "top_level",  default: false
  end

  create_table "team_groups_teams", id: false, force: true do |t|
    t.integer "team_id",       null: false
    t.integer "team_group_id", null: false
  end

  add_index "team_groups_teams", ["team_group_id", "team_id"], name: "index_team_groups_teams_on_team_group_id_and_team_id", using: :btree
  add_index "team_groups_teams", ["team_id", "team_group_id"], name: "index_team_groups_teams_on_team_id_and_team_group_id", using: :btree

  create_table "team_groups_user_groups", id: false, force: true do |t|
    t.integer "user_group_id", null: false
    t.integer "team_group_id", null: false
  end

  add_index "team_groups_user_groups", ["team_group_id", "user_group_id"], name: "team_g_user_g_index", using: :btree
  add_index "team_groups_user_groups", ["user_group_id", "team_group_id"], name: "user_g_team_g_index", using: :btree

  create_table "teams", force: true do |t|
    t.string "full_name"
    t.string "location"
    t.string "nickname"
    t.string "primary_color"
    t.string "secondary_color"
  end

  create_table "user_group_subscriptions", force: true do |t|
    t.integer  "user_id"
    t.integer  "user_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_groups", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "unowned",                default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
