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

ActiveRecord::Schema.define(version: 2018_05_05_072843) do

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "energies", force: :cascade do |t|
    t.integer "house_id"
    t.integer "label"
    t.integer "year"
    t.integer "month"
    t.float "temperature"
    t.float "daylight"
    t.integer "energy_production"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_energies_on_house_id"
  end

  create_table "houses", force: :cascade do |t|
    t.integer "city_id"
    t.string "first_name"
    t.string "last_name"
    t.integer "num_of_people"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "has_child"
    t.index ["city_id"], name: "index_houses_on_city_id"
  end

end
