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

ActiveRecord::Schema.define(version: 20140710101259) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "google_models", force: true do |t|
    t.string   "member_id"
    t.string   "urls"
    t.string   "create_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "googleplus", force: true do |t|
    t.string   "urls"
    t.datetime "create_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "member_id"
    t.string   "post_link"
  end

  create_table "members", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "username"
    t.string   "twitter_id"
    t.string   "gplus_id"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "twitter_token"
    t.string   "twitter_secret"
    t.string   "gplus_token"
    t.string   "img_url"
    t.string   "gplus_refresh_token"
    t.string   "gplus_token_expires_at"
  end

  add_index "members", ["email"], name: "index_members_on_email", unique: true, using: :btree
  add_index "members", ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true, using: :btree

  create_table "twitter_models", force: true do |t|
    t.string   "urls"
    t.datetime "create_date"
    t.integer  "member_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "twitters", force: true do |t|
    t.string   "urls"
    t.datetime "create_date"
    t.integer  "member_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
