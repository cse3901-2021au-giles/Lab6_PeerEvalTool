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

ActiveRecord::Schema.define(version: 2021_12_06_053917) do

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "instructor_id", null: false
    t.index ["instructor_id"], name: "index_courses_on_instructor_id"
  end

  create_table "evals", force: :cascade do |t|
    t.text "comment"
    t.integer "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "author_id", null: false
    t.integer "recipient_id", null: false
    t.index ["author_id"], name: "index_evals_on_author_id"
    t.index ["recipient_id"], name: "index_evals_on_recipient_id"
  end

  create_table "instructors", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "team_id"
    t.integer "course_id", null: false
    t.index ["course_id"], name: "index_projects_on_course_id"
  end

  create_table "student_teams", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "team_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["student_id"], name: "index_student_teams_on_student_id"
    t.index ["team_id"], name: "index_student_teams_on_team_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.integer "course_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_students_on_course_id"
    t.index ["email"], name: "index_students_on_email", unique: true
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "instructor_id", null: false
    t.integer "course_id"
    t.index ["instructor_id"], name: "index_teams_on_instructor_id"
  end

  add_foreign_key "courses", "instructors"
  add_foreign_key "evals", "students", column: "author_id"
  add_foreign_key "evals", "students", column: "recipient_id"
  add_foreign_key "projects", "courses"
  add_foreign_key "student_teams", "students"
  add_foreign_key "student_teams", "teams"
  add_foreign_key "students", "courses"
  add_foreign_key "teams", "instructors"
end
