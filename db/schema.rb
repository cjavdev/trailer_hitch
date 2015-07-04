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

ActiveRecord::Schema.define(version: 20150704174248) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "uid"
    t.string   "name"
    t.string   "screen_name"
    t.string   "location"
    t.string   "description"
    t.integer  "followers_count",            default: 0
    t.integer  "friends_count",              default: 0
    t.integer  "listed_count",               default: 0
    t.integer  "favorites_count",            default: 0
    t.string   "lang"
    t.integer  "statuses_count",             default: 0
    t.boolean  "following_now"
    t.boolean  "followed_before"
    t.integer  "follower_id",      limit: 8
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "followee_id",      limit: 8
    t.date     "unfollowed_at"
    t.boolean  "following_me_now",           default: true
    t.date     "followed_at"
    t.date     "unfollowed_me_at"
    t.date     "followed_me_at"
  end

  add_index "profiles", ["follower_id"], name: "index_profiles_on_follower_id", using: :btree
  add_index "profiles", ["uid", "follower_id"], name: "index_profiles_on_uid_and_follower_id", unique: true, using: :btree
  add_index "profiles", ["uid"], name: "index_profiles_on_uid", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "secret"
    t.string   "token"
    t.string   "uid"
    t.string   "name"
    t.string   "image"
    t.string   "session_token"
    t.string   "nickname"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "users", ["uid"], name: "index_users_on_uid", unique: true, using: :btree

end
