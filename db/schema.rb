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

ActiveRecord::Schema[8.0].define(version: 2024_11_06_190250) do
  create_table "bugs", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "severity"
    t.integer "status"
    t.date "due_date"
    t.integer "story_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sprint_id"
    t.index ["sprint_id"], name: "index_bugs_on_sprint_id"
    t.index ["story_id"], name: "index_bugs_on_story_id"
  end

  create_table "epics", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "status"
    t.date "due_date"
    t.integer "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sprints", force: :cascade do |t|
    t.string "title"
    t.date "start_date"
    t.date "end_date"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stories", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "status"
    t.date "due_date"
    t.integer "points"
    t.integer "epic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sprint_id"
    t.index ["epic_id"], name: "index_stories_on_epic_id"
    t.index ["sprint_id"], name: "index_stories_on_sprint_id"
  end

  create_table "subtasks", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "status"
    t.date "due_date"
    t.integer "story_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["story_id"], name: "index_subtasks_on_story_id"
  end

  add_foreign_key "bugs", "sprints"
  add_foreign_key "bugs", "stories"
  add_foreign_key "stories", "epics"
  add_foreign_key "stories", "sprints"
  add_foreign_key "subtasks", "stories"
end
