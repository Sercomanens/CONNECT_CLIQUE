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

ActiveRecord::Schema[7.1].define(version: 2024_06_21_173500) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.float "latitude"
    t.float "longitude"
    t.text "description"
    t.date "date_1"
    t.date "date_2"
    t.date "date_3"
    t.date "most_voted_date"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.datetime "start_time"
    t.datetime "end_time"
    t.boolean "voting_closed"
    t.date "winning_date"
    t.time "time_1"
    t.time "time_2"
    t.time "time_3"
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "attendances", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "activity_id", null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_attendances_on_activity_id"
    t.index ["user_id"], name: "index_attendances_on_user_id"
  end

  create_table "friends", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "attendee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attendee_id"], name: "index_friends_on_attendee_id"
    t.index ["user_id"], name: "index_friends_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "nickname"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.date "selected_date"
    t.bigint "user_id", null: false
    t.bigint "activity_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_votes_on_activity_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "activities", "users"
  add_foreign_key "attendances", "activities"
  add_foreign_key "attendances", "users"
  add_foreign_key "friends", "users"
  add_foreign_key "friends", "users", column: "attendee_id"
  add_foreign_key "votes", "activities"
  add_foreign_key "votes", "users"
end
