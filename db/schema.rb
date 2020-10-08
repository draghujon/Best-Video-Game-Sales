# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_07_211309) do

  create_table "game_platforms", force: :cascade do |t|
    t.integer "game_publisher_id", null: false
    t.integer "platform_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "release_year"
    t.index ["game_publisher_id"], name: "index_game_platforms_on_game_publisher_id"
    t.index ["platform_id"], name: "index_game_platforms_on_platform_id"
  end

  create_table "game_publishers", force: :cascade do |t|
    t.integer "game_id", null: false
    t.integer "publisher_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_game_publishers_on_game_id"
    t.index ["publisher_id"], name: "index_game_publishers_on_publisher_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "game_name"
    t.string "game_dev"
    t.integer "genre_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["genre_id"], name: "index_games_on_genre_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "genre_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "platforms", force: :cascade do |t|
    t.string "platform_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "publishers", force: :cascade do |t|
    t.string "pub_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "region_sales", force: :cascade do |t|
    t.string "num_sales"
    t.integer "region_id", null: false
    t.integer "game_platform_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_platform_id"], name: "index_region_sales_on_game_platform_id"
    t.index ["region_id"], name: "index_region_sales_on_region_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "region_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "game_platforms", "game_publishers"
  add_foreign_key "game_platforms", "platforms"
  add_foreign_key "game_publishers", "games"
  add_foreign_key "game_publishers", "publishers"
  add_foreign_key "games", "genres"
  add_foreign_key "region_sales", "game_platforms"
  add_foreign_key "region_sales", "regions"
end
