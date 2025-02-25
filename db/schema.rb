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

ActiveRecord::Schema.define(version: 2020_01_19_121956) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "product_in_shopping_lists", force: :cascade do |t|
    t.bigint "shopping_list_id"
    t.bigint "product_id"
    t.integer "quantity"
    t.index ["product_id"], name: "index_product_in_shopping_lists_on_product_id"
    t.index ["shopping_list_id"], name: "index_product_in_shopping_lists_on_shopping_list_id"
  end

  create_table "product_in_shops", force: :cascade do |t|
    t.float "price"
    t.bigint "shop_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id", "shop_id"], name: "index_product_in_shops_on_product_id_and_shop_id", unique: true
    t.index ["product_id"], name: "index_product_in_shops_on_product_id"
    t.index ["shop_id"], name: "index_product_in_shops_on_shop_id"
  end

  create_table "products", force: :cascade do |t|
    t.text "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "shopping_lists", force: :cascade do |t|
    t.text "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_shopping_lists_on_user_id"
  end

  create_table "shops", force: :cascade do |t|
    t.text "name"
    t.text "address"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_shops_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.text "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "product_in_shopping_lists", "products"
  add_foreign_key "product_in_shopping_lists", "shopping_lists"
  add_foreign_key "product_in_shops", "products"
  add_foreign_key "product_in_shops", "shops"
  add_foreign_key "products", "users"
  add_foreign_key "shopping_lists", "users"
  add_foreign_key "shops", "users"
end
