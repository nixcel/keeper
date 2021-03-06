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

ActiveRecord::Schema.define(:version => 20080625171531) do

  create_table "costcenters", :force => true do |t|
    t.integer  "account"
    t.integer  "sru"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"
  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"

  create_table "transactions", :force => true do |t|
    t.integer  "verification_id",                                  :null => false
    t.decimal  "debit",              :precision => 9, :scale => 2, :null => false
    t.decimal  "credit",             :precision => 9, :scale => 2, :null => false
    t.integer  "costcenter_account",                               :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "verifications", :force => true do |t|
    t.date     "date"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
