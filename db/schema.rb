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

ActiveRecord::Schema.define(:version => 20110313010330) do

  create_table "dog_photos", :force => true do |t|
    t.string   "dog_photo_file_name"
    t.string   "dog_photo_content_type"
    t.integer  "dog_photo_file_size"
    t.datetime "dog_photo_updated_at"
    t.integer  "dog_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dogs", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "sex"
    t.float    "weight"
    t.integer  "age"
    t.string   "breed"
    t.text     "characteristics"
    t.string   "video_url"
    t.boolean  "adopted",         :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "happy_tails", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.text     "content"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.string   "name"
    t.string   "email_address"
    t.string   "phone_number"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news_entries", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.text     "content"
    t.string   "form_file_name"
    t.string   "form_content_type"
    t.integer  "form_file_size"
    t.datetime "form_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", :force => true do |t|
    t.text     "question"
    t.text     "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "email_address"
    t.string   "password_digest"
    t.string   "role",            :default => "guest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
