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

ActiveRecord::Schema.define(:version => 20120417134023) do

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "expirations", :force => true do |t|
    t.date     "date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "facilities", :force => true do |t|
    t.string   "name"
    t.string   "serial"
    t.integer  "plant_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "plants", :force => true do |t|
    t.string   "name"
    t.string   "serial"
    t.string   "address"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "stages", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tasks", :force => true do |t|
    t.string   "number"
    t.text     "description"
    t.text     "comments"
    t.integer  "issued_department_id"
    t.integer  "received_department_id"
    t.integer  "facility_id"
    t.string   "detailed_schedule_number"
    t.string   "code"
    t.string   "stamp_name"
    t.integer  "stage_id"
    t.string   "step_number"
    t.string   "contract_number"
    t.integer  "issued_chief_id"
    t.integer  "received_chief_id"
    t.integer  "issued_group_head_id"
    t.integer  "received_group_head_id"
    t.integer  "received_staff_id"
    t.integer  "chief_project_engineer_id"
    t.date     "issue_date"
    t.integer  "expiration_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

end
