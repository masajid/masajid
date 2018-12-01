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

ActiveRecord::Schema.define(version: 2018_12_01_204047) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "content_addresses", force: :cascade do |t|
    t.string "street"
    t.string "zipcode"
    t.string "phone"
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.bigint "content_city_id"
    t.bigint "content_region_id"
    t.bigint "content_country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_city_id"], name: "index_content_addresses_on_content_city_id"
    t.index ["content_country_id"], name: "index_content_addresses_on_content_country_id"
    t.index ["content_region_id"], name: "index_content_addresses_on_content_region_id"
  end

  create_table "content_cities", force: :cascade do |t|
    t.string "name"
    t.bigint "content_region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_region_id"], name: "index_content_cities_on_content_region_id"
  end

  create_table "content_countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "content_regions", force: :cascade do |t|
    t.string "name"
    t.bigint "content_country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_country_id"], name: "index_content_regions_on_content_country_id"
  end

  create_table "content_roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "content_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_content_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_content_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_content_users_on_reset_password_token", unique: true
  end

  add_foreign_key "content_addresses", "content_cities"
  add_foreign_key "content_addresses", "content_countries"
  add_foreign_key "content_addresses", "content_regions"
  add_foreign_key "content_cities", "content_regions"
  add_foreign_key "content_regions", "content_countries"
end
