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

ActiveRecord::Schema.define(version: 2018_08_18_013003) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recipient_id"
    t.integer "leftover_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["leftover_id"], name: "index_conversations_on_leftover_id"
    t.index ["recipient_id"], name: "index_conversations_on_recipient_id"
    t.index ["sender_id", "recipient_id", "leftover_id"], name: "conversation_index", unique: true
    t.index ["sender_id"], name: "index_conversations_on_sender_id"
  end

  create_table "leftovers", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.date "start_on"
    t.date "end_on"
    t.bigint "user_id"
    t.boolean "expired"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "image"
    t.integer "category_id"
    t.index ["category_id"], name: "index_leftovers_on_category_id"
    t.index ["user_id"], name: "index_leftovers_on_user_id"
  end

  create_table "offers", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "leftover_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["leftover_id"], name: "index_offers_on_leftover_id"
    t.index ["user_id", "leftover_id"], name: "index_offers_on_user_id_and_leftover_id", unique: true
    t.index ["user_id"], name: "index_offers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "leftovers", "users"
  add_foreign_key "offers", "leftovers"
  add_foreign_key "offers", "users"
end
