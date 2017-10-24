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

ActiveRecord::Schema.define(version: 20171024182314) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "unaccent"

  create_table "divisions", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_divisions_on_name"
    t.index ["parent_id"], name: "index_divisions_on_parent_id"
  end

  create_table "people", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_people_on_name"
  end

  create_table "phones", id: :serial, force: :cascade do |t|
    t.string "ddr"
    t.string "branch"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch"], name: "index_phones_on_branch"
    t.index ["ddr"], name: "index_phones_on_ddr"
  end

  create_table "phones_divisions", force: :cascade do |t|
    t.bigint "phone_id"
    t.bigint "division_id"
    t.index ["division_id"], name: "index_phones_divisions_on_division_id"
    t.index ["phone_id"], name: "index_phones_divisions_on_phone_id"
  end

  create_table "phones_people", force: :cascade do |t|
    t.bigint "phone_id"
    t.bigint "person_id"
    t.index ["person_id"], name: "index_phones_people_on_person_id"
    t.index ["phone_id"], name: "index_phones_people_on_phone_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
