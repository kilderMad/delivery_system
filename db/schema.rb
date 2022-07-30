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

ActiveRecord::Schema[7.0].define(version: 2022_07_29_214916) do
  create_table "budget_histories", force: :cascade do |t|
    t.decimal "freight"
    t.integer "deadline"
    t.decimal "cubic_size"
    t.integer "carrier_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "zip_code"
    t.index ["carrier_id"], name: "index_budget_histories_on_carrier_id"
  end

  create_table "carriers", force: :cascade do |t|
    t.string "fantasy_name"
    t.string "cnpj"
    t.string "domain"
    t.string "address"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 1
  end

  create_table "deadlines", force: :cascade do |t|
    t.integer "distance_min"
    t.integer "distance_max"
    t.integer "time_arrive"
    t.integer "carrier_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carrier_id"], name: "index_deadlines_on_carrier_id"
  end

  create_table "order_updates", force: :cascade do |t|
    t.date "date"
    t.string "hour"
    t.string "last_location"
    t.string "next_location"
    t.integer "order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_updates_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "code"
    t.integer "status", default: 1
    t.decimal "cubic_size"
    t.string "pickup_address"
    t.string "receiver_address"
    t.string "receiver_name"
    t.string "receiver_cpf"
    t.string "receiver_phone"
    t.integer "deadline"
    t.integer "carrier_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "price"
    t.integer "vehicle_id"
    t.string "zip_code"
    t.index ["carrier_id"], name: "index_orders_on_carrier_id"
    t.index ["vehicle_id"], name: "index_orders_on_vehicle_id"
  end

  create_table "prices", force: :cascade do |t|
    t.decimal "cbm_min"
    t.decimal "cbm_max"
    t.decimal "value"
    t.integer "carrier_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "state"
    t.integer "deadline"
    t.index ["carrier_id"], name: "index_prices_on_carrier_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "admin", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "carrier_id"
    t.index ["carrier_id"], name: "index_users_on_carrier_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "plate"
    t.string "brand"
    t.string "model"
    t.string "year"
    t.integer "capacity"
    t.integer "carrier_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carrier_id"], name: "index_vehicles_on_carrier_id"
  end

  add_foreign_key "budget_histories", "carriers"
  add_foreign_key "deadlines", "carriers"
  add_foreign_key "order_updates", "orders"
  add_foreign_key "orders", "carriers"
  add_foreign_key "orders", "vehicles"
  add_foreign_key "prices", "carriers"
  add_foreign_key "users", "carriers"
  add_foreign_key "vehicles", "carriers"
end
