# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140207184151) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses_pools", force: true do |t|
    t.string   "subject"
    t.string   "course_number"
    t.integer  "min_students_to_teach"
    t.integer  "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rooms", force: true do |t|
    t.integer  "capacity"
    t.integer  "number"
    t.integer  "school_id"
    t.integer  "teacher_course_possibility_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schedules", force: true do |t|
    t.integer  "school_id"
    t.integer  "room_id"
    t.integer  "time_id"
    t.integer  "teacher_course_possibility_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schools", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.text     "bio"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teacher_course_possibilities", force: true do |t|
    t.integer  "courses_pool_id"
    t.integer  "teacher_id"
    t.boolean  "scheduled_course", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teachers", force: true do |t|
    t.string   "name"
    t.text     "bio"
    t.integer  "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "timespans", force: true do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "timeable_id"
    t.string   "timeable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
