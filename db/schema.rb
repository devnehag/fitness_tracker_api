
ActiveRecord::Schema[7.1].define(version: 2024_02_25_145359) do
  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workouts", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_workouts_on_user_id"
  end

  add_foreign_key "workouts", "users"
end
