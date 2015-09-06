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

ActiveRecord::Schema.define(version: 20150902091142) do

  create_table "activities", force: true do |t|
    t.integer  "activitable_id"
    t.string   "value"
    t.string   "action",           null: false
    t.integer  "user_id",          null: false
    t.string   "activitable_type", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["activitable_id"], name: "index_activities_on_activitable_id", using: :btree
  add_index "activities", ["user_id"], name: "index_activities_on_user_id", using: :btree

  create_table "annotations", force: true do |t|
    t.integer  "volume_id",   null: false
    t.integer  "user_id",     null: false
    t.integer  "page",        null: false
    t.integer  "location_x"
    t.integer  "location_y"
    t.integer  "height"
    t.integer  "width"
    t.integer  "zorder"
    t.integer  "hltype"
    t.string   "text"
    t.string   "anntype",     null: false
    t.string   "basketpages"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "annotations", ["user_id"], name: "index_annotations_on_user_id", using: :btree
  add_index "annotations", ["volume_id"], name: "index_annotations_on_volume_id", using: :btree

  create_table "authors", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bhl_statistics", force: true do |t|
    t.integer  "books_count"
    t.integer  "authors_count"
    t.integer  "species_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "book_authors", force: true do |t|
    t.integer  "book_id",    null: false
    t.integer  "author_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "book_languages", force: true do |t|
    t.integer  "book_id",     null: false
    t.integer  "language_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "book_locations", force: true do |t|
    t.integer  "book_id",     null: false
    t.integer  "location_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "book_subjects", force: true do |t|
    t.integer  "book_id",    null: false
    t.integer  "subject_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", force: true do |t|
    t.string   "title",             limit: 2000, null: false
    t.string   "title_alternative", limit: 2000
    t.string   "published_at"
    t.string   "publisher",         limit: 1000
    t.text     "mods"
    t.string   "status_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bookstatuses", force: true do |t|
    t.string   "name"
    t.string   "code",       limit: 2, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "collection_ratings", force: true do |t|
    t.integer  "collection_id",                                       null: false
    t.integer  "user_id",                                             null: false
    t.decimal  "rate",          precision: 2, scale: 1, default: 0.0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "collection_ratings", ["collection_id"], name: "index_collection_ratings_on_collection_id", using: :btree
  add_index "collection_ratings", ["user_id"], name: "index_collection_ratings_on_user_id", using: :btree

  create_table "collection_volumes", force: true do |t|
    t.integer  "volume_id",     null: false
    t.integer  "collection_id", null: false
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "collection_volumes", ["collection_id"], name: "index_collection_volumes_on_collection_id", using: :btree
  add_index "collection_volumes", ["volume_id"], name: "index_collection_volumes_on_volume_id", using: :btree

  create_table "collections", force: true do |t|
    t.integer  "user_id",                                             null: false
    t.string   "title",                                               null: false
    t.string   "description"
    t.boolean  "is_public",                           default: false
    t.string   "photo_name"
    t.decimal  "rate",        precision: 2, scale: 1, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "collections", ["rate"], name: "index_collections_on_rate", using: :btree
  add_index "collections", ["title"], name: "index_collections_on_title", using: :btree

  create_table "comments", force: true do |t|
    t.string   "text",                         null: false
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.integer  "number_of_marks",  default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id"], name: "index_comments_on_commentable_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "countries", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "email_messages", force: true do |t|
    t.string   "name",       null: false
    t.string   "email",      null: false
    t.string   "subject",    null: false
    t.string   "message",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hierarchies", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hierarchy_entries", force: true do |t|
    t.integer  "hierarchy_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "languages", force: true do |t|
    t.string   "code",       null: false
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "formatted_address", null: false
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifiers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "queries", force: true do |t|
    t.string   "string"
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "queries", ["user_id"], name: "index_queries_on_user_id", using: :btree

  create_table "subjects", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_volume_histories", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "volume_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username",                            null: false
    t.string   "password",                            null: false
    t.string   "real_name",                           null: false
    t.string   "email",                               null: false
    t.boolean  "active",              default: false
    t.string   "guid",                                null: false
    t.string   "verification_code"
    t.datetime "verified_date"
    t.datetime "last_login"
    t.string   "last_login_language"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["guid"], name: "index_users_on_guid", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", using: :btree

  create_table "volume_ratings", force: true do |t|
    t.integer  "volume_id",                                        null: false
    t.integer  "user_id",                                          null: false
    t.decimal  "rate",       precision: 2, scale: 1, default: 0.0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "volume_ratings", ["user_id"], name: "index_volume_ratings_on_user_id", using: :btree
  add_index "volume_ratings", ["volume_id"], name: "index_volume_ratings_on_volume_id", using: :btree

  create_table "volumes", force: true do |t|
    t.integer  "book_id",                                             null: false
    t.integer  "job_id",                                              null: false
    t.integer  "volume_number"
    t.decimal  "rate",          precision: 2, scale: 1, default: 0.0
    t.string   "status_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "volumes", ["book_id"], name: "index_volumes_on_book_id", using: :btree
  add_index "volumes", ["job_id"], name: "index_volumes_on_job_id", using: :btree

  create_table "volumestatuses", force: true do |t|
    t.string   "name"
    t.string   "code",       limit: 2, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
