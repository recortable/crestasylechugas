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

ActiveRecord::Schema.define(:version => 20090122043011) do

  create_table "clips", :force => true do |t|
    t.string   "title",         :null => false
    t.string   "description",   :null => false
    t.string   "content_class"
    t.string   "content_type"
    t.integer  "content_id"
    t.integer  "user_id",       :null => false
    t.integer  "group_id",      :null => false
    t.integer  "recipient_id",  :null => false
    t.string   "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clips", ["date"], :name => "index_clips_on_date"

  create_table "documents", :force => true do |t|
    t.string   "dialect"
    t.string   "title"
    t.text     "body"
    t.integer  "parent_id"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", :force => true do |t|
    t.string   "name",                       :null => false
    t.string   "description",                :null => false
    t.boolean  "gak",                        :null => false
    t.integer  "cestas",      :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups_users", :id => false, :force => true do |t|
    t.integer "group_id"
    t.integer "user_id"
  end

  create_table "pendings", :force => true do |t|
    t.integer "user_id"
    t.integer "clip_id"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type"], :name => "index_taggings_on_taggable_id_and_taggable_type"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "pass"
    t.string   "movil"
    t.string   "fijo"
    t.boolean  "admin",      :default => false
    t.boolean  "active",     :default => true
    t.datetime "access"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
