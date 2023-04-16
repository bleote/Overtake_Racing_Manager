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

ActiveRecord::Schema[7.0].define(version: 2023_04_16_192234) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.string "engine"
    t.integer "gearbox"
    t.integer "suspension"
    t.integer "downforce"
    t.string "aero_setup"
    t.string "gear_ratio"
    t.string "tyres"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_cars_on_team_id"
  end

  create_table "chiefs", force: :cascade do |t|
    t.string "chief_name"
    t.bigint "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_chiefs_on_team_id"
  end

  create_table "circuits", force: :cascade do |t|
    t.string "circuit_name"
    t.integer "slow_curves"
    t.integer "medium_curves"
    t.integer "fast_curves"
    t.integer "short_straights"
    t.integer "medium_straights"
    t.integer "long_straights"
    t.integer "pitstop_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drivers", force: :cascade do |t|
    t.string "driver_name"
    t.string "helmet"
    t.bigint "team_id", null: false
    t.bigint "car_id", null: false
    t.integer "driving_skills"
    t.integer "fitness_level"
    t.integer "overtaking"
    t.integer "defending"
    t.integer "wet_race"
    t.integer "driver_points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_drivers_on_car_id"
    t.index ["team_id"], name: "index_drivers_on_team_id"
  end

  create_table "races", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "circuit_id", null: false
    t.string "weather"
    t.string "status"
    t.bigint "team01_id", null: false
    t.bigint "team02_id", null: false
    t.bigint "team03_id", null: false
    t.bigint "team04_id", null: false
    t.bigint "team05_id", null: false
    t.bigint "team06_id", null: false
    t.bigint "team07_id", null: false
    t.bigint "team08_id", null: false
    t.bigint "team09_id", null: false
    t.bigint "team10_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["circuit_id"], name: "index_races_on_circuit_id"
    t.index ["team01_id"], name: "index_races_on_team01_id"
    t.index ["team02_id"], name: "index_races_on_team02_id"
    t.index ["team03_id"], name: "index_races_on_team03_id"
    t.index ["team04_id"], name: "index_races_on_team04_id"
    t.index ["team05_id"], name: "index_races_on_team05_id"
    t.index ["team06_id"], name: "index_races_on_team06_id"
    t.index ["team07_id"], name: "index_races_on_team07_id"
    t.index ["team08_id"], name: "index_races_on_team08_id"
    t.index ["team09_id"], name: "index_races_on_team09_id"
    t.index ["team10_id"], name: "index_races_on_team10_id"
    t.index ["user_id"], name: "index_races_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "team_name"
    t.string "team_logo"
    t.string "color"
    t.integer "team_points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cars", "teams"
  add_foreign_key "chiefs", "teams"
  add_foreign_key "drivers", "cars"
  add_foreign_key "drivers", "teams"
  add_foreign_key "races", "circuits"
  add_foreign_key "races", "teams", column: "team01_id"
  add_foreign_key "races", "teams", column: "team02_id"
  add_foreign_key "races", "teams", column: "team03_id"
  add_foreign_key "races", "teams", column: "team04_id"
  add_foreign_key "races", "teams", column: "team05_id"
  add_foreign_key "races", "teams", column: "team06_id"
  add_foreign_key "races", "teams", column: "team07_id"
  add_foreign_key "races", "teams", column: "team08_id"
  add_foreign_key "races", "teams", column: "team09_id"
  add_foreign_key "races", "teams", column: "team10_id"
  add_foreign_key "races", "users"
end
