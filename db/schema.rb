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

ActiveRecord::Schema.define(version: 20170601173534) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "event_users", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_users_on_event_id"
    t.index ["user_id"], name: "index_event_users_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "date"
    t.string "category"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
    t.integer "host_id"
  end

  create_table "matches", force: :cascade do |t|
    t.integer "likes_id"
    t.integer "liked_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["liked_id"], name: "index_matches_on_liked_id"
    t.index ["likes_id", "liked_id"], name: "index_matches_on_likes_id_and_liked_id", unique: true
    t.index ["likes_id"], name: "index_matches_on_likes_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.boolean "mgender"
    t.boolean "fgender"
    t.boolean "qgender"
    t.integer "height"
    t.string "picture_url"
    t.string "city"
    t.datetime "birthday"
    t.string "phone_number"
    t.string "email"
    t.string "password_digest"
    t.boolean "men"
    t.boolean "women"
    t.boolean "genderqueer"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "event_users", "events"
  add_foreign_key "event_users", "users"
end
