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

ActiveRecord::Schema.define(version: 20200315164223) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "assays", force: :cascade do |t|
    t.string   "name"
    t.boolean  "display"
    t.integer  "step",       default: 0
    t.integer  "row_order"
    t.boolean  "locked",     default: false
    t.integer  "last_step",  default: 0
    t.date     "today_date"
    t.float    "percentage", default: 0.0
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "assays_projects", force: :cascade do |t|
    t.integer "assay_id"
    t.integer "project_id"
  end

  add_index "assays_projects", ["assay_id"], name: "index_assays_projects_on_assay_id", using: :btree
  add_index "assays_projects", ["project_id"], name: "index_assays_projects_on_project_id", using: :btree

  create_table "boxes", force: :cascade do |t|
    t.string   "name"
    t.string   "barcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clone_attachments", force: :cascade do |t|
    t.integer  "clone_id"
    t.string   "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clone_batch_as_plasmid_attachments", force: :cascade do |t|
    t.integer  "clone_batch_id"
    t.string   "attachment"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "clone_batch_attachments", force: :cascade do |t|
    t.integer  "clone_batch_id"
    t.string   "attachment"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "clone_batches", force: :cascade do |t|
    t.integer  "target_id"
    t.string   "name"
    t.string   "temp_name"
    t.text     "comment"
    t.boolean  "qc_validation",             default: false
    t.integer  "strict_validation",         default: 0
    t.integer  "plasmid_validation",        default: 0
    t.date     "date_as_plasmid"
    t.string   "glyc_stock_box_as_plasmid"
    t.text     "comment_as_plasmid"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "type_id"
    t.integer  "clone_id"
    t.string   "number"
    t.integer  "strand_id"
    t.integer  "origin_id"
    t.integer  "inventory_validation",      default: 0
    t.integer  "nb"
    t.integer  "dismissed",                 default: 0
    t.integer  "plasmid_batches_count",     default: 0,     null: false
    t.text     "recap"
  end

  create_table "clone_batches_genes", force: :cascade do |t|
    t.integer "clone_batch_id"
    t.integer "gene_id"
  end

  create_table "clone_batches_options", force: :cascade do |t|
    t.integer  "clone_batch_id"
    t.integer  "option_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "clone_batches_pcr_colonies", force: :cascade do |t|
    t.integer "clone_batch_id"
    t.integer "pcr_colony_id"
  end

  create_table "clone_batches_productions", force: :cascade do |t|
    t.integer "clone_batch_id"
    t.integer "production_id"
  end

  create_table "clone_batches_promoters", force: :cascade do |t|
    t.integer "clone_batch_id"
    t.integer "promoter_id"
  end

  create_table "clone_batches_sequencings", force: :cascade do |t|
    t.integer "clone_batch_id"
    t.integer "sequencing_id"
  end

  create_table "clone_batches_users", force: :cascade do |t|
    t.integer  "clone_batch_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clones", force: :cascade do |t|
    t.integer  "assay_id"
    t.string   "name"
    t.string   "bbnb"
    t.integer  "batch_nb"
    t.string   "primerinsfor"
    t.string   "primerinsrev"
    t.text     "comment"
    t.text     "comment_batch"
    t.integer  "strict_validation", default: 0
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "cmeth_id"
    t.integer  "primer_f_id"
    t.integer  "primer_r_id"
  end

  create_table "clones_enzymes", force: :cascade do |t|
    t.integer "clone_id",  null: false
    t.integer "enzyme_id", null: false
  end

  create_table "clones_inserts", force: :cascade do |t|
    t.integer "clone_id"
    t.integer "insert_id"
    t.integer "backbone_id"
  end

  create_table "clones_projects", force: :cascade do |t|
    t.integer "clone_id"
    t.integer "project_id"
  end

  create_table "cmeths", force: :cascade do |t|
    t.string "name"
  end

  create_table "columns", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dosages", force: :cascade do |t|
    t.decimal "titer"
    t.decimal "titer_atcc"
    t.decimal "titer_to_atcc"
    t.integer "virus_production_id"
    t.integer "user_id"
    t.date    "date"
    t.string  "plate_name"
    t.text    "comment"
    t.date    "inactivation"
    t.date    "inactivation_atcc"
    t.date    "inactivation_standard"
    t.boolean "accepted"
  end

  create_table "enzymes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "username"
    t.string   "role"
    t.string   "firstname"
    t.string   "lastname"
    t.boolean  "actual_member",          default: true
    t.boolean  "cloning_notify",         default: true
    t.boolean  "production_notify",      default: true
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
