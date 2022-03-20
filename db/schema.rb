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

ActiveRecord::Schema.define(version: 2022_03_20_005448) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "video_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id", "video_id"], name: "index_bookmarks_on_user_id_and_video_id", unique: true
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
    t.index ["video_id"], name: "index_bookmarks_on_video_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "line_user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "role", default: 0, null: false
    t.index ["line_user_id"], name: "index_users_on_line_user_id", unique: true
  end

  create_table "videos", force: :cascade do |t|
    t.string "youtube_id", null: false
    t.string "address", null: false
    t.string "sauna", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["youtube_id"], name: "index_videos_on_youtube_id", unique: true
  end

  create_table "watches", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "video_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id", "video_id"], name: "index_watches_on_user_id_and_video_id", unique: true
    t.index ["user_id"], name: "index_watches_on_user_id"
    t.index ["video_id"], name: "index_watches_on_video_id"
  end

  add_foreign_key "bookmarks", "users"
  add_foreign_key "bookmarks", "videos"
  add_foreign_key "watches", "users"
  add_foreign_key "watches", "videos"
end
