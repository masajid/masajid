# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_05_18_123435) do

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
    t.integer "status", default: 0
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
    t.string "city_name", limit: 50, null: false
    t.string "region_name", limit: 50, null: false
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.string "addressable_type", null: false
    t.bigint "addressable_id", null: false
    t.bigint "city_id"
    t.bigint "region_id"
    t.bigint "country_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressable_type", "addressable_id"], name: "index_content_addresses_on_addressable_type_and_addressable_id"
    t.index ["city_id"], name: "index_content_addresses_on_city_id"
    t.index ["country_id"], name: "index_content_addresses_on_country_id"
    t.index ["region_id"], name: "index_content_addresses_on_region_id"
  end

  create_table "content_articles", force: :cascade do |t|
    t.string "title", null: false
    t.string "slug", null: false
    t.text "summary", null: false
    t.string "meta_title"
    t.string "meta_keywords"
    t.text "meta_descripton"
    t.datetime "published_at"
    t.datetime "deleted_at"
    t.bigint "account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_content_articles_on_account_id"
    t.index ["deleted_at"], name: "index_content_articles_on_deleted_at"
    t.index ["published_at"], name: "index_content_articles_on_published_at"
    t.index ["slug"], name: "index_content_articles_on_slug", unique: true
    t.index ["title"], name: "index_content_articles_on_title"
  end

  create_table "content_cities", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.decimal "latitude", precision: 10, scale: 6, null: false
    t.decimal "longitude", precision: 10, scale: 6, null: false
    t.bigint "country_id", null: false
    t.bigint "region_id", null: false
    t.index ["country_id"], name: "index_content_cities_on_country_id"
    t.index ["region_id"], name: "index_content_cities_on_region_id"
  end

  create_table "content_countries", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.index ["name"], name: "index_content_countries_on_name"
  end

  create_table "content_pages", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.string "permalink", null: false
    t.string "meta_title"
    t.string "meta_keywords"
    t.text "meta_description"
    t.bigint "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ancestry"
    t.integer "position"
    t.datetime "deleted_at"
    t.index ["account_id"], name: "index_content_pages_on_account_id"
    t.index ["ancestry"], name: "index_content_pages_on_ancestry"
    t.index ["deleted_at"], name: "index_content_pages_on_deleted_at"
    t.index ["position"], name: "index_content_pages_on_position"
  end

  create_table "content_regions", force: :cascade do |t|
    t.string "name", limit: 50, null: false
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

  create_table "flipper_features", force: :cascade do |t|
    t.string "key", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_flipper_features_on_key", unique: true
  end

  create_table "flipper_gates", force: :cascade do |t|
    t.string "feature_key", null: false
    t.string "key", null: false
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feature_key", "key", "value"], name: "index_flipper_gates_on_feature_key_and_key_and_value", unique: true
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

end
