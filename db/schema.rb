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

ActiveRecord::Schema[7.0].define(version: 2023_06_13_161138) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "cars", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.string "image"
    t.string "image_lg"
    t.string "constructor"
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
    t.string "name"
    t.string "image"
    t.bigint "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_chiefs_on_team_id"
  end

  create_table "circuits", force: :cascade do |t|
    t.string "name"
    t.string "layout"
    t.string "flag"
    t.integer "slow_corners"
    t.integer "medium_corners"
    t.integer "fast_corners"
    t.integer "short_straights"
    t.integer "medium_straights"
    t.integer "long_straights"
    t.integer "pitstop_time"
    t.integer "ideal_lap_time"
    t.integer "total_laps"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drivers", force: :cascade do |t|
    t.string "name"
    t.string "initials"
    t.string "picture"
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

  create_table "lap_times", force: :cascade do |t|
    t.bigint "driver_id", null: false
    t.integer "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_id"], name: "index_lap_times_on_driver_id"
  end

  create_table "race_teams", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "races", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "circuit_id", null: false
    t.bigint "team_id", null: false
    t.string "weather"
    t.string "status"
    t.integer "lap_number", default: 0
    t.bigint "team_a_id", null: false
    t.bigint "team_b_id", null: false
    t.bigint "team_c_id", null: false
    t.bigint "team_d_id", null: false
    t.bigint "team_e_id", null: false
    t.bigint "team_f_id", null: false
    t.bigint "team_g_id", null: false
    t.bigint "team_h_id", null: false
    t.bigint "team_i_id", null: false
    t.bigint "team_j_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["circuit_id"], name: "index_races_on_circuit_id"
    t.index ["team_a_id"], name: "index_races_on_team_a_id"
    t.index ["team_b_id"], name: "index_races_on_team_b_id"
    t.index ["team_c_id"], name: "index_races_on_team_c_id"
    t.index ["team_d_id"], name: "index_races_on_team_d_id"
    t.index ["team_e_id"], name: "index_races_on_team_e_id"
    t.index ["team_f_id"], name: "index_races_on_team_f_id"
    t.index ["team_g_id"], name: "index_races_on_team_g_id"
    t.index ["team_h_id"], name: "index_races_on_team_h_id"
    t.index ["team_i_id"], name: "index_races_on_team_i_id"
    t.index ["team_id"], name: "index_races_on_team_id"
    t.index ["team_j_id"], name: "index_races_on_team_j_id"
    t.index ["user_id"], name: "index_races_on_user_id"
  end

  create_table "races_teams", id: false, force: :cascade do |t|
    t.bigint "race_id"
    t.bigint "team_id"
    t.index ["race_id"], name: "index_races_teams_on_race_id"
    t.index ["team_id"], name: "index_races_teams_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "logo"
    t.string "color"
    t.string "description"
    t.integer "points"
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
    t.integer "experience", default: 0
    t.integer "prestige", default: 0
    t.integer "user_races", default: 0
    t.integer "user_poles", default: 0
    t.integer "user_podiums", default: 0
    t.integer "user_victories", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cars", "teams"
  add_foreign_key "chiefs", "teams"
  add_foreign_key "drivers", "cars"
  add_foreign_key "drivers", "teams"
  add_foreign_key "lap_times", "drivers"
  add_foreign_key "races", "circuits"
  add_foreign_key "races", "teams"
  add_foreign_key "races", "teams", column: "team_a_id"
  add_foreign_key "races", "teams", column: "team_b_id"
  add_foreign_key "races", "teams", column: "team_c_id"
  add_foreign_key "races", "teams", column: "team_d_id"
  add_foreign_key "races", "teams", column: "team_e_id"
  add_foreign_key "races", "teams", column: "team_f_id"
  add_foreign_key "races", "teams", column: "team_g_id"
  add_foreign_key "races", "teams", column: "team_h_id"
  add_foreign_key "races", "teams", column: "team_i_id"
  add_foreign_key "races", "teams", column: "team_j_id"
  add_foreign_key "races", "users"
end
