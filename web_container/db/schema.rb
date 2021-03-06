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

ActiveRecord::Schema.define(version: 2020_06_27_104953) do

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "ahoy_events", force: :cascade do |t|
    t.bigint "visit_id"
    t.bigint "user_id"
    t.string "name"
    t.jsonb "properties"
    t.datetime "time"
    t.index ["name", "time"], name: "index_ahoy_events_on_name_and_time"
    t.index ["properties"], name: "index_ahoy_events_on_properties", opclass: :jsonb_path_ops, using: :gin
    t.index ["user_id"], name: "index_ahoy_events_on_user_id"
    t.index ["visit_id"], name: "index_ahoy_events_on_visit_id"
  end

  create_table "ahoy_visits", force: :cascade do |t|
    t.string "visit_token"
    t.string "visitor_token"
    t.bigint "user_id"
    t.string "ip"
    t.text "user_agent"
    t.text "referrer"
    t.string "referring_domain"
    t.text "landing_page"
    t.string "browser"
    t.string "os"
    t.string "device_type"
    t.string "country"
    t.string "region"
    t.string "city"
    t.float "latitude"
    t.float "longitude"
    t.string "utm_source"
    t.string "utm_medium"
    t.string "utm_term"
    t.string "utm_content"
    t.string "utm_campaign"
    t.string "app_version"
    t.string "os_version"
    t.string "platform"
    t.datetime "started_at"
    t.index ["user_id"], name: "index_ahoy_visits_on_user_id"
    t.index ["visit_token"], name: "index_ahoy_visits_on_visit_token", unique: true
  end

  create_table "content_account_translations", force: :cascade do |t|
    t.bigint "content_account_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "mosque"
    t.index ["content_account_id"], name: "index_content_account_translations_on_content_account_id"
    t.index ["locale"], name: "index_content_account_translations_on_locale"
  end

  create_table "content_accounts", force: :cascade do |t|
    t.string "subdomain"
    t.string "mosque"
    t.string "responsable"
    t.bigint "owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.string "domain"
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

  create_table "content_article_translations", force: :cascade do |t|
    t.bigint "content_article_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
    t.string "slug"
    t.text "summary"
    t.text "body"
    t.index ["content_article_id"], name: "index_content_article_translations_on_content_article_id"
    t.index ["locale"], name: "index_content_article_translations_on_locale"
  end

  create_table "content_articles", force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.text "summary"
    t.text "body"
    t.datetime "published_at"
    t.datetime "deleted_at"
    t.bigint "account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "video_id"
    t.string "video_source"
    t.index ["account_id"], name: "index_content_articles_on_account_id"
    t.index ["deleted_at"], name: "index_content_articles_on_deleted_at"
    t.index ["published_at"], name: "index_content_articles_on_published_at"
    t.index ["slug"], name: "index_content_articles_on_slug", unique: true
    t.index ["title"], name: "index_content_articles_on_title"
  end

  create_table "content_articles_newsletters", id: false, force: :cascade do |t|
    t.bigint "newsletter_id", null: false
    t.bigint "article_id", null: false
    t.index ["article_id"], name: "index_content_articles_newsletters_on_article_id"
    t.index ["newsletter_id"], name: "index_content_articles_newsletters_on_newsletter_id"
  end

  create_table "content_articles_pages", id: false, force: :cascade do |t|
    t.bigint "article_id", null: false
    t.bigint "page_id", null: false
    t.index ["article_id"], name: "index_content_articles_pages_on_article_id"
    t.index ["page_id"], name: "index_content_articles_pages_on_page_id"
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

  create_table "content_configuration_translations", force: :cascade do |t|
    t.bigint "content_configuration_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "about_us"
    t.index ["content_configuration_id"], name: "index_2f65a1ab6787dbff3b30f2f4b72c7994c5a3e733"
    t.index ["locale"], name: "index_content_configuration_translations_on_locale"
  end

  create_table "content_configurations", force: :cascade do |t|
    t.string "theme", default: "default", null: false
    t.string "supported_locales", default: [], array: true
    t.string "default_locale"
    t.string "admin_locale"
    t.bigint "account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "about_us"
    t.boolean "hide_email", default: true, null: false
    t.boolean "hide_phone", default: true, null: false
    t.index ["account_id"], name: "index_content_configurations_on_account_id"
  end

  create_table "content_countries", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.index ["name"], name: "index_content_countries_on_name"
  end

  create_table "content_messages", force: :cascade do |t|
    t.string "name", null: false
    t.string "phone", null: false
    t.string "email", null: false
    t.string "subject", null: false
    t.text "body", null: false
    t.boolean "newsletter", default: false
    t.datetime "seen_at"
    t.bigint "account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_content_messages_on_account_id"
  end

  create_table "content_newsletters", force: :cascade do |t|
    t.string "subject"
    t.text "body"
    t.date "date"
    t.string "link"
    t.string "link_text"
    t.datetime "sent_at"
    t.bigint "account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_content_newsletters_on_account_id"
  end

  create_table "content_page_translations", force: :cascade do |t|
    t.bigint "content_page_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.text "description"
    t.string "permalink"
    t.index ["content_page_id"], name: "index_content_page_translations_on_content_page_id"
    t.index ["locale"], name: "index_content_page_translations_on_locale"
  end

  create_table "content_pages", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "permalink"
    t.datetime "deleted_at"
    t.bigint "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ancestry"
    t.integer "position"
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

  create_table "content_seo_content_translations", force: :cascade do |t|
    t.bigint "content_seo_content_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "meta_title"
    t.string "meta_keywords"
    t.text "meta_description"
    t.index ["content_seo_content_id"], name: "index_d5da82f2bb4ec4c246825b120124a86b93430f41"
    t.index ["locale"], name: "index_content_seo_content_translations_on_locale"
  end

  create_table "content_seo_contents", force: :cascade do |t|
    t.string "meta_title"
    t.string "meta_keywords"
    t.text "meta_description"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["searchable_type", "searchable_id"], name: "index_content_seo_contents_on_searchable_type_and_searchable_id"
  end

  create_table "content_sidebar_content_translations", force: :cascade do |t|
    t.bigint "content_sidebar_content_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
    t.text "body"
    t.index ["content_sidebar_content_id"], name: "index_4ee1cac69ad44936a61b420a0fc1d8e7b7271243"
    t.index ["locale"], name: "index_content_sidebar_content_translations_on_locale"
  end

  create_table "content_sidebar_contents", force: :cascade do |t|
    t.integer "position"
    t.string "title"
    t.text "body"
    t.boolean "light_background", default: false
    t.boolean "active", default: true
    t.bigint "account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_content_sidebar_contents_on_account_id"
    t.index ["position"], name: "index_content_sidebar_contents_on_position"
  end

  create_table "content_slider_translations", force: :cascade do |t|
    t.bigint "content_slider_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
    t.text "body"
    t.string "link"
    t.string "link_text"
    t.index ["content_slider_id"], name: "index_content_slider_translations_on_content_slider_id"
    t.index ["locale"], name: "index_content_slider_translations_on_locale"
  end

  create_table "content_sliders", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.string "link"
    t.string "link_text"
    t.bigint "account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_content_sliders_on_account_id"
  end

  create_table "content_social_networks", force: :cascade do |t|
    t.string "youtube"
    t.string "facebook"
    t.string "google"
    t.string "twitter"
    t.string "vimeo"
    t.string "instagram"
    t.bigint "account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_content_social_networks_on_account_id"
  end

  create_table "content_subscribers", force: :cascade do |t|
    t.string "email"
    t.bigint "account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_content_subscribers_on_account_id"
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
    t.string "authentication_token"
    t.index ["confirmation_token"], name: "index_content_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_content_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_content_users_on_reset_password_token", unique: true
  end

  create_table "content_volunteers", force: :cascade do |t|
    t.string "name", null: false
    t.string "identification", null: false
    t.date "birthday", null: false
    t.string "address", null: false
    t.string "phone", null: false
    t.string "email", null: false
    t.string "education", null: false
    t.text "languages", default: [], array: true
    t.string "other_languages"
    t.string "availability", null: false
    t.text "experience", null: false
    t.text "experience_place"
    t.text "experience_area", default: [], array: true
    t.bigint "account_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_content_volunteers_on_account_id"
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
    t.string "locale"
    t.index ["locale"], name: "index_friendly_id_slugs_on_locale"
    t.index ["slug", "sluggable_type", "locale"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_locale"
    t.index ["slug", "sluggable_type", "scope", "locale"], name: "index_friendly_id_slugs_uniqueness", unique: true
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
