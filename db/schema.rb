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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120530052128) do

  create_table "business_units", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "clients", :force => true do |t|
    t.string   "business_type"
    t.string   "company_name"
    t.string   "contact_name"
    t.string   "phone"
    t.string   "mobile"
    t.string   "email"
    t.string   "website"
    t.text     "address"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "image"
  end

  create_table "comments", :force => true do |t|
    t.text     "content"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "employments", :force => true do |t|
    t.integer  "supplier_id"
    t.integer  "project_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "interests", :force => true do |t|
    t.integer  "client_id"
    t.integer  "business_unit_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "prospect_id"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.integer  "client_id"
    t.integer  "user_id"
    t.integer  "business_unit_id"
    t.string   "project_manager"
    t.integer  "status"
    t.string   "lead_source"
    t.decimal  "estimation"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.string   "kind",             :default => "External"
    t.string   "image"
    t.text     "description"
  end

  create_table "prospects", :force => true do |t|
    t.string   "business_type"
    t.string   "interests"
    t.string   "company_name"
    t.string   "contact_name"
    t.string   "phone"
    t.string   "mobile"
    t.string   "email"
    t.string   "website"
    t.text     "address"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "status",        :default => 2
    t.integer  "user_id"
  end

  create_table "sellings", :force => true do |t|
    t.integer  "supplier_id"
    t.integer  "business_unit_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "suppliers", :force => true do |t|
    t.string   "company_name"
    t.string   "contact_name"
    t.string   "business_type"
    t.text     "address"
    t.string   "phone"
    t.string   "email"
    t.string   "bank_account"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "image"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "name",                   :default => "",    :null => false
    t.string   "last_name",              :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "rol"
    t.text     "address",                :default => ""
    t.string   "phone",                  :default => ""
    t.string   "cv",                     :default => ""
    t.string   "portfolio",              :default => ""
    t.string   "degree",                 :default => ""
    t.boolean  "intern",                 :default => false
    t.integer  "status",                 :default => 1
    t.string   "gender"
    t.string   "image"
    t.string   "job_title",              :default => ""
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
