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

ActiveRecord::Schema.define(version: 20150428191509) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "allergies", force: :cascade do |t|
    t.string "name"
  end

  create_table "banned_foods", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diets", force: :cascade do |t|
    t.string "name"
  end

  create_table "user_allergies", force: :cascade do |t|
    t.integer "user_id"
    t.integer "allergy_id"
  end

  create_table "user_banned_foods", force: :cascade do |t|
    t.integer "user_id"
    t.integer "banned_food_id"
  end

  add_index "user_banned_foods", ["user_id", "banned_food_id"], name: "index_user_banned_foods_on_user_id_and_banned_food_id", unique: true, using: :btree

  create_table "user_diets", force: :cascade do |t|
    t.integer "user_id"
    t.integer "diet_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_name"
    t.string   "provider"
    t.string   "email"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "login_status"
    t.string   "uid"
    t.string   "token"
    t.string   "expires_at"
    t.string   "password_digest"
    t.string   "reset_digest"
    t.integer  "phone_number",    limit: 8
  end

end
