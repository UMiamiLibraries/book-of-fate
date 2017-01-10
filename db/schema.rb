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

ActiveRecord::Schema.define(version: 20170110173503) do

  create_table "pages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "patterns", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "pattern"
    t.string   "page"
    t.string   "side"
    t.string   "offset"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "number"
    t.string   "question"
    t.boolean  "locked"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resources", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "page_id"
    t.string   "title"
    t.string   "author"
    t.string   "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["page_id"], name: "index_resources_on_page_id", using: :btree
  end

  create_table "submissions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "transcription_id"
    t.string   "submission"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["transcription_id"], name: "index_submissions_on_transcription_id", using: :btree
  end

  create_table "tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "transcription_id"
    t.integer  "page_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["page_id"], name: "index_tags_on_page_id", using: :btree
    t.index ["transcription_id"], name: "index_tags_on_transcription_id", using: :btree
  end

  create_table "transcriptions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "question_id"
    t.integer  "pattern_id"
    t.string   "transcription"
    t.boolean  "locked"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["pattern_id"], name: "index_transcriptions_on_pattern_id", using: :btree
    t.index ["question_id"], name: "index_transcriptions_on_question_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "resources", "pages"
  add_foreign_key "submissions", "transcriptions"
  add_foreign_key "tags", "pages"
  add_foreign_key "tags", "transcriptions"
  add_foreign_key "transcriptions", "patterns"
  add_foreign_key "transcriptions", "questions"
end
