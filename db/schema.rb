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

ActiveRecord::Schema.define(version: 20160802111221) do

  create_table "a_accounts", force: :cascade do |t|
    t.string   "number",       limit: 255
    t.string   "company_name", limit: 255
    t.string   "code",         limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "a_payments", force: :cascade do |t|
    t.string   "payer",             limit: 255
    t.string   "payer_account",     limit: 255
    t.string   "payer_mfo",         limit: 255
    t.string   "recipient",         limit: 255
    t.text     "detail",            limit: 65535
    t.string   "recipient_account", limit: 255
    t.string   "recipient_bank",    limit: 255
    t.string   "recipient_mfo",     limit: 255
    t.string   "recipient_egrpou",  limit: 255
    t.decimal  "sum",                             precision: 14, scale: 2
    t.integer  "request_id",        limit: 4
    t.datetime "created_at",                                                               null: false
    t.datetime "updated_at",                                                               null: false
    t.boolean  "is_deleted",                                               default: false
  end

  add_index "a_payments", ["request_id"], name: "index_a_payments_on_request_id", using: :btree

  create_table "b_accounts", force: :cascade do |t|
    t.string   "number",     limit: 255
    t.string   "name",       limit: 255
    t.decimal  "plan",                   precision: 14, scale: 2
    t.decimal  "fact",                   precision: 14, scale: 2
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  create_table "b_payments", force: :cascade do |t|
    t.integer  "b_account_id", limit: 4
    t.decimal  "sum_allowed",                precision: 14, scale: 2
    t.decimal  "sum_rest",                   precision: 14, scale: 2
    t.decimal  "sum",                        precision: 14, scale: 2
    t.string   "recipient",    limit: 255
    t.text     "detail",       limit: 65535
    t.text     "note",         limit: 65535
    t.integer  "request_id",   limit: 4
    t.datetime "created_at",                                                          null: false
    t.datetime "updated_at",                                                          null: false
    t.boolean  "is_deleted",                                          default: false
    t.integer  "resourcer_id", limit: 4
    t.integer  "a_account_id", limit: 4
  end

  add_index "b_payments", ["a_account_id"], name: "index_b_payments_on_a_account_id", using: :btree
  add_index "b_payments", ["b_account_id"], name: "index_b_payments_on_b_account_id", using: :btree
  add_index "b_payments", ["request_id"], name: "index_b_payments_on_request_id", using: :btree
  add_index "b_payments", ["resourcer_id"], name: "index_b_payments_on_resourcer_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "requests", force: :cascade do |t|
    t.date     "date"
    t.integer  "project_id",  limit: 4
    t.boolean  "is_approved"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.boolean  "is_deleted",            default: false
  end

  add_index "requests", ["project_id"], name: "index_requests_on_project_id", using: :btree

  create_table "resourcers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", limit: 255,   null: false
    t.text     "data",       limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "a_payments", "requests"
  add_foreign_key "b_payments", "a_accounts"
  add_foreign_key "b_payments", "b_accounts"
  add_foreign_key "b_payments", "requests"
  add_foreign_key "b_payments", "resourcers"
  add_foreign_key "requests", "projects"
end
