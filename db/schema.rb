# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_10_03_212938) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "channel_messages", force: :cascade do |t|
    t.text "body"
    t.bigint "server_channel_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["server_channel_id"], name: "index_channel_messages_on_server_channel_id"
    t.index ["user_id"], name: "index_channel_messages_on_user_id"
  end

  create_table "server_channels", force: :cascade do |t|
    t.string "name"
    t.bigint "server_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["server_id"], name: "index_server_channels_on_server_id"
  end

  create_table "server_invite_links", force: :cascade do |t|
    t.bigint "server_id", null: false
    t.string "uniq_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["server_id"], name: "index_server_invite_links_on_server_id"
    t.index ["uniq_id"], name: "index_server_invite_links_on_uniq_id", unique: true
  end

  create_table "server_memberships", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "server_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["server_id"], name: "index_server_memberships_on_server_id"
    t.index ["user_id"], name: "index_server_memberships_on_user_id"
  end

  create_table "servers", force: :cascade do |t|
    t.string "name"
    t.bigint "owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_servers_on_owner_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.integer "user_numbers"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "channel_messages", "server_channels"
  add_foreign_key "channel_messages", "users"
  add_foreign_key "server_channels", "servers"
  add_foreign_key "server_invite_links", "servers"
  add_foreign_key "server_memberships", "servers"
  add_foreign_key "server_memberships", "users"
  add_foreign_key "servers", "users", column: "owner_id"
end
