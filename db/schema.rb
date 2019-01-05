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

ActiveRecord::Schema.define(version: 2018_12_01_213320) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "content_accounts", force: :cascade do |t|
    t.string "subdomain"
    t.string "email"
    t.string "mosque"
    t.string "responsable"
    t.bigint "owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_content_accounts_on_owner_id"
  end

  create_table "content_addresses", force: :cascade do |t|
    t.string "first_name", limit: 50
    t.string "last_name", limit: 50
    t.string "phone", limit: 20, null: false
    t.string "mobile", limit: 20
    t.string "fax", limit: 20
    t.string "address1", null: false
    t.string "address2"
    t.string "zip_code", limit: 20
    t.string "city_name", limit: 100, null: false
    t.string "region_name", limit: 100, null: false
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.string "addressable_type", null: false
    t.bigint "addressable_id", null: false
    t.bigint "city_id", null: false
    t.bigint "region_id", null: false
    t.bigint "country_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressable_type", "addressable_id"], name: "index_content_addresses_on_addressable_type_and_addressable_id"
    t.index ["city_id"], name: "index_content_addresses_on_city_id"
    t.index ["country_id"], name: "index_content_addresses_on_country_id"
    t.index ["region_id"], name: "index_content_addresses_on_region_id"
  end

  create_table "content_cities", force: :cascade do |t|
    t.string "name", limit: 45, null: false
    t.decimal "latitude", precision: 10, scale: 6, null: false
    t.decimal "longitude", precision: 10, scale: 6, null: false
    t.string "timezone", limit: 10, null: false
    t.integer "dma_id"
    t.string "county", limit: 25
    t.string "code", limit: 4
    t.bigint "country_id", null: false
    t.bigint "region_id", null: false
    t.index ["country_id"], name: "index_content_cities_on_country_id"
    t.index ["region_id"], name: "index_content_cities_on_region_id"
  end

  create_table "content_countries", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.string "fips104", limit: 2, null: false
    t.string "iso2", limit: 2, null: false
    t.string "iso3", limit: 3, null: false
    t.string "ison", limit: 4, null: false
    t.string "internet", limit: 2, null: false
    t.string "capital", limit: 25
    t.string "map_reference", limit: 50
    t.string "nationality_singular", limit: 35
    t.string "nationality_plural", limit: 35
    t.string "currency", limit: 30
    t.string "currency_code", limit: 3
    t.integer "population"
    t.string "title", limit: 50
    t.string "comment", limit: 255
    t.index ["name"], name: "index_content_countries_on_name"
  end

  create_table "content_regions", force: :cascade do |t|
    t.string "name", limit: 45, null: false
    t.string "code", limit: 8, null: false
    t.string "adm1code", limit: 4, null: false
    t.bigint "country_id", null: false
    t.index ["country_id"], name: "index_content_regions_on_country_id"
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
    t.string "role", null: false
    t.index ["confirmation_token"], name: "index_content_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_content_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_content_users_on_reset_password_token", unique: true
  end

end
