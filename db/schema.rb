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

ActiveRecord::Schema.define(version: 2019_08_05_042448) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hashtags", force: :cascade do |t|
    t.string "keyword"
    t.string "list", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lists", force: :cascade do |t|
    t.string "id_str"
    t.string "slug"
    t.string "name"
    t.string "uri"
    t.integer "subscriber_count"
    t.string "mode"
    t.string "description"
    t.string "full_name"
    t.string "password_digest"
  end

  create_table "tweet_details", force: :cascade do |t|
    t.string "tweet_id"
    t.jsonb "tweet_user"
    t.jsonb "tweet_entities"
    t.jsonb "tweet_extended_entities"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tweets", force: :cascade do |t|
    t.string "tweet_id"
    t.datetime "created_at", null: false
    t.string "lang"
    t.string "user_name"
    t.string "user_profile_id"
    t.string "handle"
    t.text "content"
    t.string "profile_img_url"
    t.string "location"
    t.integer "favorites"
    t.integer "retweets"
    t.string "user_mentions", default: [], array: true
    t.string "urls", default: [], array: true
    t.string "hashtags", default: [], array: true
    t.string "media", default: [], array: true
    t.datetime "updated_at", null: false
  end

  create_table "twitter_accounts", force: :cascade do |t|
    t.string "name"
    t.string "screen_name"
    t.string "topic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "votes", force: :cascade do |t|
    t.string "type"
    t.bigint "user_id"
    t.bigint "tweet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tweet_id"], name: "index_votes_on_tweet_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "votes", "tweets"
  add_foreign_key "votes", "users"
end
