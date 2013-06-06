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

ActiveRecord::Schema.define(:version => 20130606134309) do

  create_table "areas", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "merchants", :force => true do |t|
    t.string   "mid"
    t.string   "brand"
    t.string   "branch"
    t.string   "address"
    t.string   "tag"
    t.string   "road_name"
    t.string   "area_name"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "merchants", ["area_name"], :name => "index_merchants_on_area_name"
  add_index "merchants", ["branch"], :name => "index_merchants_on_branch"
  add_index "merchants", ["brand"], :name => "index_merchants_on_brand"
  add_index "merchants", ["road_name"], :name => "index_merchants_on_road_name"

  create_table "roads", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "words", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
