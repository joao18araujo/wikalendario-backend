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

ActiveRecord::Schema.define(version: 2020_09_02_005230) do

  create_table "campi", force: :cascade do |t|
    t.string "name"
    t.integer "university_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["university_id"], name: "index_campi_on_university_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.integer "campus_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["campus_id"], name: "index_courses_on_campus_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.integer "campus_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["campus_id"], name: "index_departments_on_campus_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "semesters", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "university_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["university_id"], name: "index_semesters_on_university_id"
  end

  create_table "subject_classes", force: :cascade do |t|
    t.string "name"
    t.integer "subject_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["subject_id"], name: "index_subject_classes_on_subject_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.integer "department_id", null: false
    t.integer "semester_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_id"], name: "index_subjects_on_department_id"
    t.index ["semester_id"], name: "index_subjects_on_semester_id"
  end

  create_table "universities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "campi", "universities"
  add_foreign_key "courses", "campi"
  add_foreign_key "departments", "campi"
  add_foreign_key "semesters", "universities"
  add_foreign_key "subject_classes", "subjects"
  add_foreign_key "subjects", "departments"
  add_foreign_key "subjects", "semesters"
end
