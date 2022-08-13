# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_08_13_182529) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bricks", force: :cascade do |t|
    t.bigint "realty_id", null: false
    t.boolean "on_sale", default: false, null: false
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["realty_id"], name: "index_bricks_on_realty_id"
    t.index ["user_id"], name: "index_bricks_on_user_id"
  end

  create_table "realties", force: :cascade do |t|
    t.text "address"
    t.text "img"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.text "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bricks", "realties"
  add_foreign_key "bricks", "users"
end
