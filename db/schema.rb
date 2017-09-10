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

ActiveRecord::Schema.define(version: 20170910182358) do

  create_table "boats", force: :cascade do |t|
    t.string   "name"
    t.string   "make"
    t.integer  "length"
    t.integer  "rating"
    t.integer  "owner_id"
    t.integer  "race_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_boats_on_owner_id"
    t.index ["race_id"], name: "index_boats_on_race_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "positions_users", force: :cascade do |t|
    t.integer "position_id"
    t.integer "user_id"
    t.index ["position_id"], name: "index_positions_users_on_position_id"
    t.index ["user_id"], name: "index_positions_users_on_user_id"
  end

  create_table "race_crews", force: :cascade do |t|
    t.integer  "crew_id"
    t.integer  "race_position_id"
    t.integer  "boat_id"
    t.integer  "race_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["boat_id"], name: "index_race_crews_on_boat_id"
    t.index ["crew_id"], name: "index_race_crews_on_crew_id"
    t.index ["race_id"], name: "index_race_crews_on_race_id"
    t.index ["race_position_id"], name: "index_race_crews_on_race_position_id"
  end

  create_table "races", force: :cascade do |t|
    t.string   "name",       default: "1"
    t.datetime "date"
    t.integer  "regatta_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["regatta_id"], name: "index_races_on_regatta_id"
  end

  create_table "regattas", force: :cascade do |t|
    t.string   "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",                  default: "", null: false
    t.string   "phone_number"
    t.integer  "weight"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "provider"
    t.string   "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["provider"], name: "index_users_on_provider"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid"], name: "index_users_on_uid"
  end

end
