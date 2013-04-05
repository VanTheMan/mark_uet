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

ActiveRecord::Schema.define(:version => 20130405153043) do

  create_table "marks", :force => true do |t|
    t.string   "title"
    t.string   "link"
    t.datetime "uploaded_at"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "code"
    t.string   "category"
  end

  create_table "subjects", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  create_table "subjects_users", :id => false, :force => true do |t|
    t.integer "subject_id"
    t.integer "user_id"
  end

  add_index "subjects_users", ["subject_id", "user_id"], :name => "index_subjects_users_on_subject_id_and_user_id"
  add_index "subjects_users", ["user_id", "subject_id"], :name => "index_subjects_users_on_user_id_and_subject_id"

# Could not dump table "users" because of following StandardError
#   Unknown type 'array' for column 'subjects_subcribe'

  create_table "users_subjects", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "subject_id"
  end

  add_index "users_subjects", ["subject_id", "user_id"], :name => "index_users_subjects_on_subject_id_and_user_id"
  add_index "users_subjects", ["user_id", "subject_id"], :name => "index_users_subjects_on_user_id_and_subject_id"

end
