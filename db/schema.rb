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

ActiveRecord::Schema.define(version: 20170601074813) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actors", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date     "dob"
    t.string   "first_name"
    t.string   "last_name"
  end

  create_table "actors_movies", id: false, force: :cascade do |t|
    t.integer "actor_id", null: false
    t.integer "movie_id", null: false
  end

  create_table "carts", force: :cascade do |t|
    t.integer  "quantity"
    t.datetime "return_at"
    t.datetime "rent_at"
    t.integer  "movie_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_carts_on_movie_id", using: :btree
    t.index ["user_id"], name: "index_carts_on_user_id", using: :btree
  end

  create_table "genres", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres_movies", id: false, force: :cascade do |t|
    t.integer "genre_id", null: false
    t.integer "movie_id", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string   "title"
    t.integer  "release_year"
    t.text     "description"
    t.string   "imdb_id"
    t.string   "poster"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "quantity"
    t.string   "filetype"
    t.float    "rating"
    t.integer  "price_cents"
    t.string   "price_currency", default: "AUD", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "address"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.date     "dob"
    t.integer  "age"
    t.boolean  "admin"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "carts", "movies"
  add_foreign_key "carts", "users"
end
