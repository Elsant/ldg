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

ActiveRecord::Schema.define(version: 20160301205040) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fav_stores", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "store"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "fav_stores", ["user_id"], name: "index_fav_stores_on_user_id", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "occasions", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.integer  "style",         limit: 2
    t.datetime "occasion_time"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "occasions", ["user_id"], name: "index_occasions_on_user_id", using: :btree

  create_table "sizesets", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "shirt"
    t.integer  "neck",       limit: 2
    t.integer  "jacket"
    t.integer  "waist"
    t.decimal  "shoe"
    t.integer  "height"
    t.integer  "weight"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "sizesets", ["user_id"], name: "index_sizesets_on_user_id", using: :btree

  create_table "styles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "gender_preference", limit: 2
    t.integer  "work_style",        limit: 2
    t.integer  "evening_style",     limit: 2
    t.integer  "shirt_fit",         limit: 2
    t.integer  "pants_fit",         limit: 2
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "styles", ["user_id"], name: "index_styles_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "firstname",                             null: false
    t.string   "lastname",                              null: false
    t.string   "email",                  default: "",   null: false
    t.string   "slug"
    t.date     "birthdate"
    t.string   "phone",                                 null: false
    t.string   "zipcode",                               null: false
    t.text     "description"
    t.boolean  "enabled",                default: true
    t.string   "market_source"
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,    null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["firstname"], name: "index_users_on_firstname", using: :btree
  add_index "users", ["lastname"], name: "index_users_on_lastname", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["slug"], name: "index_users_on_slug", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
  add_index "users", ["zipcode"], name: "index_users_on_zipcode", using: :btree

  add_foreign_key "fav_stores", "users"
  add_foreign_key "occasions", "users"
  add_foreign_key "sizesets", "users"
  add_foreign_key "styles", "users"
end
