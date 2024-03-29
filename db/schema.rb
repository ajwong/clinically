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

ActiveRecord::Schema.define(version: 20131006054736) do

  create_table "jobs", force: true do |t|
    t.string   "category"
    t.text     "description"
    t.datetime "deadline_at"
    t.datetime "completed_at"
    t.integer  "patient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "jobs", ["patient_id"], name: "index_jobs_on_patient_id"

  create_table "patients", force: true do |t|
    t.string   "last_name"
    t.string   "given_name"
    t.date     "born_on"
    t.string   "uri"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sex",             limit: 1
    t.string   "image_file_name"
  end

end
