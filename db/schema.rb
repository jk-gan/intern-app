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

ActiveRecord::Schema.define(version: 20170620135750) do

  create_table "addresses", force: :cascade do |t|
    t.integer "company_id"
    t.text "street_address"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "postcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_addresses_on_company_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "size"
    t.text "website"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "logo_file_name"
    t.string "logo_content_type"
    t.integer "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "contacts", force: :cascade do |t|
    t.integer "company_id"
    t.string "name"
    t.string "role"
    t.string "contact_number"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["company_id"], name: "index_contacts_on_company_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.integer "company_id"
    t.string "name"
    t.text "description"
    t.float "working_hours"
    t.string "dress_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_jobs_on_company_id"
  end

  create_table "scopes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scopings", force: :cascade do |t|
    t.integer "job_id"
    t.integer "scope_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_scopings_on_job_id"
    t.index ["scope_id"], name: "index_scopings_on_scope_id"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer "company_id"
    t.integer "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_taggings_on_company_id"
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "welfares", force: :cascade do |t|
    t.integer "job_id"
    t.boolean "training"
    t.text "training_detail"
    t.boolean "accomodation"
    t.boolean "free_food"
    t.text "free_food_detail"
    t.text "other_benefits"
    t.decimal "allowance", precision: 8, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_welfares_on_job_id"
  end

end
