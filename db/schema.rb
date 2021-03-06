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

ActiveRecord::Schema.define(version: 2019_03_26_204422) do

  create_table "comments", force: :cascade do |t|
    t.string "title"
    t.string "body"
    t.integer "job_posting_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_posting_id"], name: "index_comments_on_job_posting_id"
  end

  create_table "employers", force: :cascade do |t|
    t.string "name"
    t.string "company_desc"
    t.string "employee_count"
    t.string "logo_url"
    t.string "industry"
    t.string "founded_date"
    t.string "headquarters_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "job_postings", force: :cascade do |t|
    t.string "position_name"
    t.string "position_desc"
    t.string "location"
    t.string "benefits"
    t.integer "employer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employer_id"], name: "index_job_postings_on_employer_id"
  end

end
