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

ActiveRecord::Schema.define(version: 20170608184004) do

  create_table "headquarters", force: :cascade do |t|
  end

  create_table "orders", force: :cascade do |t|
    t.string "name"
    t.integer "requester_id"
    t.integer "provider_id"
    t.string "type"
    t.index ["provider_id"], name: "index_orders_on_provider_id"
    t.index ["requester_id"], name: "index_orders_on_requester_id"
  end

  create_table "retailers", force: :cascade do |t|
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
  end

  create_table "tailors", force: :cascade do |t|
  end

  create_table "welcome_kits", force: :cascade do |t|
  end

end
