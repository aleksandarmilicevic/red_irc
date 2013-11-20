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

ActiveRecord::Schema.define(:version => 20131022120511) do

  create_table "auth_users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_hash"
    t.string   "type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "remember_token"
  end

  create_table "chat_rooms", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "server_as_room_id"
    t.string   "server_as_room_type"
  end

  add_index "chat_rooms", ["server_as_room_id"], :name => "index_chat_rooms_on_server_as_room_id"

  create_table "chat_rooms_msgs_messages", :id => false, :force => true do |t|
    t.integer "chat_room_id"
    t.integer "msg_id"
  end

  create_table "chat_rooms_users_members", :id => false, :force => true do |t|
    t.integer "chat_room_id"
    t.integer "user_id"
  end

  create_table "msgs", :force => true do |t|
    t.text     "text"
    t.integer  "sender_id"
    t.string   "sender_type"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.integer  "chat_room_as_message_id"
  end

  add_index "msgs", ["chat_room_as_message_id"], :name => "index_msgs_on_chat_room_as_message_id"

  create_table "servers_chat_rooms_rooms", :id => false, :force => true do |t|
    t.integer "server_id"
    t.integer "chat_room_id"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "web_clients", :force => true do |t|
    t.string   "auth_token"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "web_servers", :force => true do |t|
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "web_servers_web_clients_online_clients", :id => false, :force => true do |t|
    t.integer "web_server_id"
    t.integer "web_client_id"
  end

end
