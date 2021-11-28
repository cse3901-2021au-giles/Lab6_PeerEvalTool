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

ActiveRecord::Schema.define(version: 2021_11_28_035723) do

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.integer "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_activities_on_course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.integer "instructor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["instructor_id"], name: "index_courses_on_instructor_id"
  end

  create_table "evals", force: :cascade do |t|
    t.integer "author_id", null: false
    t.integer "recipient_id", null: false
    t.text "comments"
    t.integer "rating"
    t.integer "activity_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["activity_id"], name: "index_evals_on_activity_id"
    t.index ["author_id"], name: "index_evals_on_author_id"
    t.index ["recipient_id"], name: "index_evals_on_recipient_id"
  end

  create_table "instructors", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_instructors_on_course_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "team_id", null: false
    t.integer "instructor_id", null: false
    t.integer "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_students_on_course_id"
    t.index ["instructor_id"], name: "index_students_on_instructor_id"
    t.index ["team_id"], name: "index_students_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.integer "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_teams_on_course_id"
  end

  add_foreign_key "activities", "courses"
  add_foreign_key "courses", "instructors"
  add_foreign_key "evals", "activities"
  add_foreign_key "evals", "students", column: "author_id"
  add_foreign_key "evals", "students", column: "recipient_id"
  add_foreign_key "instructors", "courses"
  add_foreign_key "students", "courses"
  add_foreign_key "students", "instructors"
  add_foreign_key "students", "teams"
  add_foreign_key "teams", "courses"
end
