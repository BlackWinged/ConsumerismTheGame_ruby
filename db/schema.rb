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

ActiveRecord::Schema.define(version: 20170202184952) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bet_anals", force: :cascade do |t|
    t.integer  "undrawnCycleCount"
    t.integer  "undrawnBallCount"
    t.datetime "measuredTime"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "nameOfLoto"
    t.string   "refererUrl"
  end

  create_table "economic_objects", force: :cascade do |t|
    t.integer  "supply"
    t.decimal  "production"
    t.decimal  "costOfStorage"
    t.decimal  "funds"
    t.string   "type"
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["user_id"], name: "index_economic_objects_on_user_id", using: :btree
  end

  create_table "items", force: :cascade do |t|
    t.integer  "quantity"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "offer_id"
    t.index ["offer_id"], name: "index_items_on_offer_id", using: :btree
    t.index ["product_id"], name: "index_items_on_product_id", using: :btree
  end

  create_table "offers", force: :cascade do |t|
    t.integer  "source_id"
    t.integer  "target_id"
    t.string   "message"
    t.decimal  "money"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_id"], name: "index_offers_on_source_id", using: :btree
    t.index ["target_id"], name: "index_offers_on_target_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "type"
    t.decimal  "price"
    t.decimal  "demand"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
