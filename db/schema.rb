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

ActiveRecord::Schema[8.1].define(version: 2025_04_27_032213) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.string "content_type"
    t.datetime "created_at", precision: nil, null: false
    t.string "filename", null: false
    t.string "key", null: false
    t.text "metadata"
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "albums", force: :cascade do |t|
    t.string "album_art_path", default: "/images/"
    t.datetime "created_at", precision: nil, null: false
    t.text "description"
    t.date "release_date"
    t.text "spanish_desc"
    t.string "title"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "blog_categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.integer "sort_priority"
    t.datetime "updated_at", null: false
  end

  create_table "blog_posts", force: :cascade do |t|
    t.bigint "blog_category_id", null: false
    t.text "body_markdown"
    t.datetime "created_at", null: false
    t.string "header_image_url"
    t.boolean "is_draft", default: false
    t.string "path", null: false
    t.boolean "pinned", default: false
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["blog_category_id"], name: "index_blog_posts_on_blog_category_id"
    t.index ["path"], name: "index_blog_posts_on_path", unique: true
  end

  create_table "news_items", force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.date "item_date"
    t.text "spanish_text"
    t.text "text"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "songs", force: :cascade do |t|
    t.bigint "album_id"
    t.string "artist"
    t.datetime "created_at", precision: nil, null: false
    t.integer "download_count", default: 0
    t.string "file_path", default: "/songs/"
    t.string "filetype", default: "mp3"
    t.text "lyrics"
    t.integer "play_count", default: 0
    t.string "title"
    t.integer "track_no"
    t.datetime "updated_at", precision: nil, null: false
    t.index ["album_id"], name: "index_songs_on_album_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "blog_posts", "blog_categories"
  add_foreign_key "songs", "albums"
end
