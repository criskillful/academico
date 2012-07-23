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

ActiveRecord::Schema.define(:version => 20120717203119) do

  create_table "blood_types", :force => true do |t|
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "cities", ["state_id"], :name => "index_cities_on_state_id"

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.string   "nationality"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "education_degrees", :force => true do |t|
    t.string   "degree"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "genders", :force => true do |t|
    t.string   "gender"
    t.string   "acronym"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "marital_statuses", :force => true do |t|
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "name"
    t.string   "birth_date"
    t.string   "father_name"
    t.string   "mom_name"
    t.string   "email"
    t.string   "lattes_url"
    t.integer  "gender_id"
    t.integer  "education_degree_id"
    t.integer  "race_id"
    t.integer  "marital_status_id"
    t.integer  "blood_type_id"
    t.integer  "country_id"
    t.integer  "state_id"
    t.integer  "city_id"
    t.integer  "number_children"
    t.boolean  "isemployee"
    t.boolean  "isstudent"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "people", ["blood_type_id"], :name => "index_people_on_blood_type_id"
  add_index "people", ["city_id"], :name => "index_people_on_city_id"
  add_index "people", ["country_id"], :name => "index_people_on_country_id"
  add_index "people", ["education_degree_id"], :name => "index_people_on_education_degree_id"
  add_index "people", ["gender_id"], :name => "index_people_on_gender_id"
  add_index "people", ["marital_status_id"], :name => "index_people_on_marital_status_id"
  add_index "people", ["race_id"], :name => "index_people_on_race_id"
  add_index "people", ["state_id"], :name => "index_people_on_state_id"

  create_table "races", :force => true do |t|
    t.string   "race"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "special_needs_types", :force => true do |t|
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.string   "acronym"
    t.integer  "country_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "states", ["country_id"], :name => "index_states_on_country_id"

end
