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

ActiveRecord::Schema.define(version: 20151027185441) do

  create_table "activities", force: :cascade do |t|
    t.integer  "activitable_id",    limit: 4
    t.string   "value",             limit: 255
    t.string   "action",            limit: 255, null: false
    t.integer  "user_id",           limit: 4,   null: false
    t.string   "activitable_type",  limit: 255, null: false
    t.string   "activitable_title", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["activitable_id"], name: "index_activities_on_activitable_id", using: :btree
  add_index "activities", ["user_id"], name: "index_activities_on_user_id", using: :btree

  create_table "annotations", force: :cascade do |t|
    t.integer  "volume_id",   limit: 4,   null: false
    t.integer  "user_id",     limit: 4,   null: false
    t.integer  "page",        limit: 4,   null: false
    t.integer  "location_x",  limit: 4
    t.integer  "location_y",  limit: 4
    t.integer  "height",      limit: 4
    t.integer  "width",       limit: 4
    t.integer  "zorder",      limit: 4
    t.integer  "hltype",      limit: 4
    t.string   "text",        limit: 255
    t.string   "anntype",     limit: 255, null: false
    t.string   "basketpages", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "annotations", ["user_id"], name: "index_annotations_on_user_id", using: :btree
  add_index "annotations", ["volume_id"], name: "index_annotations_on_volume_id", using: :btree

  create_table "authors", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bhl_statistics", force: :cascade do |t|
    t.integer  "books_count",   limit: 4
    t.integer  "authors_count", limit: 4
    t.integer  "species_count", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "book_authors", force: :cascade do |t|
    t.integer  "book_id",    limit: 4, null: false
    t.integer  "author_id",  limit: 4, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "book_languages", force: :cascade do |t|
    t.integer  "book_id",     limit: 4, null: false
    t.integer  "language_id", limit: 4, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "book_locations", force: :cascade do |t|
    t.integer  "book_id",     limit: 4, null: false
    t.integer  "location_id", limit: 4, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "book_statuses", force: :cascade do |t|
    t.string   "status_code", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "book_subjects", force: :cascade do |t|
    t.integer  "book_id",    limit: 4, null: false
    t.integer  "subject_id", limit: 4, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", force: :cascade do |t|
    t.string   "title",             limit: 2000
    t.string   "title_alternative", limit: 2000
    t.string   "published_at",      limit: 255
    t.string   "publisher",         limit: 1000
    t.text     "mods",              limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "bib_id",            limit: 255
    t.string   "bibtex",            limit: 255
    t.string   "endnote",           limit: 255
    t.integer  "book_status_id",    limit: 4
  end

  create_table "collection_ratings", force: :cascade do |t|
    t.integer  "collection_id", limit: 4,                                       null: false
    t.integer  "user_id",       limit: 4,                                       null: false
    t.decimal  "rate",                    precision: 2, scale: 1, default: 0.0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "collection_ratings", ["collection_id"], name: "index_collection_ratings_on_collection_id", using: :btree
  add_index "collection_ratings", ["user_id"], name: "index_collection_ratings_on_user_id", using: :btree

  create_table "collection_volumes", force: :cascade do |t|
    t.integer  "volume_id",     limit: 4, null: false
    t.integer  "collection_id", limit: 4, null: false
    t.integer  "position",      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "collection_volumes", ["collection_id"], name: "index_collection_volumes_on_collection_id", using: :btree
  add_index "collection_volumes", ["volume_id"], name: "index_collection_volumes_on_volume_id", using: :btree

  create_table "collections", force: :cascade do |t|
    t.integer  "user_id",     limit: 4,                                           null: false
    t.string   "title",       limit: 255,                                         null: false
    t.string   "description", limit: 255
    t.boolean  "is_public",                                       default: false
    t.string   "photo_name",  limit: 255
    t.decimal  "rate",                    precision: 2, scale: 1, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "collections", ["rate"], name: "index_collections_on_rate", using: :btree
  add_index "collections", ["title"], name: "index_collections_on_title", using: :btree

  create_table "comments", force: :cascade do |t|
    t.string   "text",             limit: 255,             null: false
    t.integer  "commentable_id",   limit: 4
    t.string   "commentable_type", limit: 255
    t.integer  "user_id",          limit: 4
    t.integer  "number_of_marks",  limit: 4,   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id"], name: "index_comments_on_commentable_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "countries", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "email_messages", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.string   "email",      limit: 255, null: false
    t.string   "subject",    limit: 255, null: false
    t.string   "message",    limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hierarchies", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hierarchy_entries", force: :cascade do |t|
    t.integer  "hierarchy_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "languages", force: :cascade do |t|
    t.string   "code",       limit: 255, null: false
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: :cascade do |t|
    t.string   "formatted_address", limit: 255, null: false
    t.float    "latitude",          limit: 24
    t.float    "longitude",         limit: 24
    t.integer  "country_id",        limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "queries", force: :cascade do |t|
    t.string   "string",     limit: 255
    t.integer  "user_id",    limit: 4,   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "queries", ["user_id"], name: "index_queries_on_user_id", using: :btree

  create_table "subjects", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_volume_histories", force: :cascade do |t|
    t.integer  "user_id",    limit: 4, null: false
    t.integer  "volume_id",  limit: 4, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",            limit: 255,                 null: false
    t.string   "password",            limit: 255,                 null: false
    t.string   "real_name",           limit: 255,                 null: false
    t.string   "email",               limit: 255,                 null: false
    t.boolean  "active",                          default: false
    t.string   "guid",                limit: 255,                 null: false
    t.string   "verification_code",   limit: 255
    t.datetime "verified_date"
    t.datetime "last_login"
    t.string   "last_login_language", limit: 255
    t.string   "photo_name",          limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["guid"], name: "index_users_on_guid", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", using: :btree

  create_table "volume_ratings", force: :cascade do |t|
    t.integer  "volume_id",  limit: 4,                                       null: false
    t.integer  "user_id",    limit: 4,                                       null: false
    t.decimal  "rate",                 precision: 2, scale: 1, default: 0.0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "volume_ratings", ["user_id"], name: "index_volume_ratings_on_user_id", using: :btree
  add_index "volume_ratings", ["volume_id"], name: "index_volume_ratings_on_volume_id", using: :btree

  create_table "volumes", force: :cascade do |t|
    t.integer  "book_id",       limit: 4,                                         null: false
    t.integer  "job_id",        limit: 4,                                         null: false
    t.integer  "volume_number", limit: 4
    t.decimal  "rate",                      precision: 2, scale: 1, default: 0.0
    t.string   "status_code",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "volumes", ["book_id"], name: "index_volumes_on_book_id", using: :btree
  add_index "volumes", ["job_id"], name: "index_volumes_on_job_id", using: :btree

  create_table "volumestatuses", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "code",       limit: 2,   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
