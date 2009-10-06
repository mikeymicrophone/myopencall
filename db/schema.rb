# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091005234238) do

  create_table "calls", :force => true do |t|
    t.integer  "project_id"
    t.integer  "role_id"
    t.integer  "location_id"
    t.datetime "time"
    t.integer  "creator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "details", :force => true do |t|
    t.text     "content"
    t.text     "context"
    t.string   "subject_type"
    t.integer  "subject_id"
    t.integer  "creator_id"
    t.integer  "private"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "delta"
    t.datetime "deleted_at"
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "address"
    t.string   "line2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "floor"
    t.string   "room"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "creator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "creator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "login"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "perishable_token"
    t.integer  "login_count"
    t.datetime "last_request_at"
    t.datetime "last_login_at"
    t.datetime "current_login_at"
    t.string   "last_login_ip"
    t.string   "current_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wysihat_files", :force => true do |t|
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
