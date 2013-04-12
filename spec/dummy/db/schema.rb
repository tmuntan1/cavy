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

ActiveRecord::Schema.define(version: 20130412191728) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "cavy_admin_item_groups", force: true do |t|
    t.string   "title"
    t.string   "params",     array: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cavy_items", force: true do |t|
    t.hstore   "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
  end

  create_table "cavy_page_translations", force: true do |t|
    t.integer  "cavy_page_id"
    t.string   "locale"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cavy_page_translations", ["cavy_page_id"], name: "index_cavy_page_translations_on_cavy_page_id"
  add_index "cavy_page_translations", ["locale"], name: "index_cavy_page_translations_on_locale"

  create_table "cavy_pages", force: true do |t|
    t.text     "content"
    t.string   "title"
    t.string   "render"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "route"
    t.text     "description"
    t.string   "tags",          array: true
    t.hstore   "page_elements"
    t.hstore   "data"
  end

  create_table "cavy_users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "role"
    t.string   "auth_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

end
