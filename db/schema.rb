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

ActiveRecord::Schema.define(version: 2018_07_29_233458) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buyer_requests", force: :cascade do |t|
    t.bigint "buyer_id"
    t.bigint "request_id"
    t.integer "price"
    t.boolean "sold", default: false
    t.index ["buyer_id"], name: "index_buyer_requests_on_buyer_id"
    t.index ["request_id"], name: "index_buyer_requests_on_request_id"
  end

  create_table "buyers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "hp"
    t.string "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "avatar"
    t.index ["email"], name: "index_buyers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_buyers_on_reset_password_token", unique: true
  end

  create_table "items", force: :cascade do |t|
    t.bigint "request_id"
    t.string "name"
    t.string "description"
    t.string "qty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["request_id"], name: "index_items_on_request_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "buyer_id"
    t.bigint "seller_id"
    t.boolean "sender"
    t.text "content"
    t.index ["buyer_id"], name: "index_messages_on_buyer_id"
    t.index ["seller_id"], name: "index_messages_on_seller_id"
  end

  create_table "requests", force: :cascade do |t|
    t.integer "seller_id"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status", default: false
    t.float "latitude"
    t.float "longitude"
  end

  create_table "sellers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "name"
    t.string "hp"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "postal"
    t.float "latitude"
    t.float "longitude"
    t.string "avatar"
    t.index ["email"], name: "index_sellers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_sellers_on_reset_password_token", unique: true
  end

  add_foreign_key "items", "requests"
end
