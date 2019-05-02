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

ActiveRecord::Schema.define(version: 20190502190359) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.string "full_name"
    t.date "date_of_birth"
    t.text "present_address"
    t.string "community"
    t.integer "length_of_stay_at_present_address"
    t.string "mobile"
    t.string "occupation"
    t.string "email"
    t.boolean "personal_property"
    t.boolean "jointly_owned_property"
    t.boolean "agent"
    t.boolean "has_authority_from_owner"
    t.boolean "has_site_plan"
    t.boolean "site_plan_request"
    t.boolean "search_report"
    t.boolean "search_report_request"
    t.boolean "valuation_report"
    t.boolean "valuation_report_request"
    t.integer "type_of_service"
    t.text "request_details"
    t.date "request_date"
    t.string "client_signature"
    t.bigint "user_id"
    t.string "signature_of_authorized_broker"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "deals", force: :cascade do |t|
    t.bigint "contact_id"
    t.bigint "property_id"
    t.integer "type_of_service"
    t.date "request_date"
    t.text "request_details"
    t.integer "amount_cents", default: 0, null: false
    t.string "amount_currency", default: "USD", null: false
    t.date "deadline"
    t.integer "stage"
    t.date "expiration_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date_of_closing"
    t.bigint "user_id"
    t.index ["contact_id"], name: "index_deals_on_contact_id"
    t.index ["property_id"], name: "index_deals_on_property_id"
    t.index ["user_id"], name: "index_deals_on_user_id"
  end

  create_table "milestones", force: :cascade do |t|
    t.string "title"
    t.date "start_date"
    t.date "due_date"
    t.text "description"
    t.integer "target_type", default: 0, null: false
    t.decimal "target", precision: 15, scale: 2
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "properties", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "location"
    t.integer "category"
    t.integer "property_type"
    t.bigint "contact_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "listing_type", default: 0, null: false
    t.index ["contact_id"], name: "index_properties_on_contact_id"
  end

  create_table "user_milestones", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "milestone_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["milestone_id"], name: "index_user_milestones_on_milestone_id"
    t.index ["user_id"], name: "index_user_milestones_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "contacts", "users"
  add_foreign_key "deals", "contacts"
  add_foreign_key "deals", "properties"
  add_foreign_key "deals", "users"
  add_foreign_key "properties", "contacts"
  add_foreign_key "user_milestones", "milestones"
  add_foreign_key "user_milestones", "users"
end
