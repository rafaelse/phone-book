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

ActiveRecord::Schema.define(version: 20171002115226) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "unaccent"
  enable_extension "fuzzystrmatch"
  enable_extension "pg_trgm"

  create_table "divisions", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "ancestors"
    t.index ["parent_id"], name: "index_divisions_on_parent_id", using: :btree
  end

  create_table "people", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phones", force: :cascade do |t|
    t.string   "ddr"
    t.string   "ramal"
    t.integer  "person_id"
    t.integer  "division_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["division_id"], name: "index_phones_on_division_id", using: :btree
    t.index ["person_id"], name: "index_phones_on_person_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "password_digest"
    t.boolean  "admin"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "phones", "divisions"
  add_foreign_key "phones", "people"
end
