ActiveRecord::Schema[7.1].define(version: 2025_01_21_180436) do
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shows", force: :cascade do |t|
    t.bigint "stage_id", null: false
    t.bigint "artist_id", null: false
    t.date "date"
    t.time "start_time"
    t.time "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_shows_on_artist_id"
    t.index ["stage_id"], name: "index_shows_on_stage_id"
  end

  create_table "stages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_shows", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id", null: false
    t.bigint "show_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["show_id"], name: "index_user_shows_on_show_id"
    t.index ["user_id"], name: "index_user_shows_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
    t.check_constraint "email::text ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$'::text", name: "email_format_check"
  end

  add_foreign_key "shows", "artists"
  add_foreign_key "shows", "stages"
  add_foreign_key "user_shows", "shows"
  add_foreign_key "user_shows", "users"
end
