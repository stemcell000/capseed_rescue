# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_30_100018) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", id: :serial, force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "assays", id: :serial, force: :cascade do |t|
    t.string "name"
    t.boolean "display"
    t.integer "step", default: 0
    t.integer "row_order"
    t.boolean "locked", default: false
    t.integer "last_step", default: 0
    t.date "today_date"
    t.float "percentage", default: 0.0
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "box_types", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "max_position"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "vertical_max"
    t.integer "horizontal_max"
  end

  create_table "boxes", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "barcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "box_type_id"
    t.integer "shelf_id"
  end

  create_table "buildings", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clone_attachments", id: :serial, force: :cascade do |t|
    t.integer "clone_id"
    t.string "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clone_batch_as_plasmid_attachments", id: :serial, force: :cascade do |t|
    t.integer "clone_batch_id"
    t.string "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clone_batch_attachments", id: :serial, force: :cascade do |t|
    t.integer "clone_batch_id"
    t.string "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clone_batches", id: :serial, force: :cascade do |t|
    t.integer "target_id"
    t.string "name"
    t.string "temp_name"
    t.text "comment"
    t.boolean "qc_validation", default: false
    t.integer "strict_validation", default: 0
    t.integer "plasmid_validation", default: 0
    t.date "date_as_plasmid"
    t.string "glyc_stock_box_as_plasmid"
    t.text "comment_as_plasmid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "type_id"
    t.integer "clone_id"
    t.string "number"
    t.integer "strand_id"
    t.integer "origin_id"
    t.integer "inventory_validation", default: 0
    t.integer "nb"
    t.integer "dismissed", default: 0
    t.integer "plasmid_batches_count", default: 0, null: false
    t.text "recap"
    t.boolean "hidden"
    t.index ["target_id"], name: "index_clone_batches_on_target_id"
  end

  create_table "clone_batches_genes", id: :serial, force: :cascade do |t|
    t.integer "clone_batch_id"
    t.integer "gene_id"
    t.index ["clone_batch_id"], name: "index_clone_batches_genes_on_clone_batch_id"
    t.index ["gene_id"], name: "index_clone_batches_genes_on_gene_id"
  end

  create_table "clone_batches_options", id: :serial, force: :cascade do |t|
    t.integer "clone_batch_id"
    t.integer "option_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clone_batch_id"], name: "index_clone_batches_options_on_clone_batch_id"
    t.index ["option_id"], name: "index_clone_batches_options_on_option_id"
  end

  create_table "clone_batches_pcr_colonies", id: :serial, force: :cascade do |t|
    t.integer "clone_batch_id"
    t.integer "pcr_colony_id"
    t.index ["clone_batch_id"], name: "index_clone_batches_pcr_colonies_on_clone_batch_id"
    t.index ["pcr_colony_id"], name: "index_clone_batches_pcr_colonies_on_pcr_colony_id"
  end

  create_table "clone_batches_productions", id: :serial, force: :cascade do |t|
    t.integer "clone_batch_id"
    t.integer "production_id"
    t.index ["clone_batch_id"], name: "index_clone_batches_productions_on_clone_batch_id"
    t.index ["production_id"], name: "index_clone_batches_productions_on_production_id"
  end

  create_table "clone_batches_promoters", id: :serial, force: :cascade do |t|
    t.integer "clone_batch_id"
    t.integer "promoter_id"
    t.index ["clone_batch_id"], name: "index_clone_batches_promoters_on_clone_batch_id"
    t.index ["promoter_id"], name: "index_clone_batches_promoters_on_promoter_id"
  end

  create_table "clone_batches_sequencings", id: :serial, force: :cascade do |t|
    t.integer "clone_batch_id"
    t.integer "sequencing_id"
    t.index ["clone_batch_id"], name: "index_clone_batches_sequencings_on_clone_batch_id"
    t.index ["sequencing_id"], name: "index_clone_batches_sequencings_on_sequencing_id"
  end

  create_table "clones", id: :serial, force: :cascade do |t|
    t.integer "assay_id"
    t.string "name"
    t.string "bbnb"
    t.integer "batch_nb"
    t.string "primerinsfor"
    t.string "primerinsrev"
    t.text "comment"
    t.text "comment_batch"
    t.integer "strict_validation", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cmeth_id"
    t.integer "primer_f_id"
    t.integer "primer_r_id"
  end

  create_table "clones_enzymes", id: :serial, force: :cascade do |t|
    t.integer "clone_id"
    t.integer "enzyme_id"
    t.index ["clone_id"], name: "index_clones_enzymes_on_clone_id"
    t.index ["enzyme_id"], name: "index_clones_enzymes_on_enzyme_id"
  end

  create_table "clones_inserts", id: :serial, force: :cascade do |t|
    t.integer "clone_id"
    t.integer "insert_id"
    t.integer "backbone_id"
    t.index ["clone_id"], name: "index_clones_inserts_on_clone_id"
    t.index ["insert_id"], name: "index_clones_inserts_on_insert_id"
  end

  create_table "clones_projects", id: :serial, force: :cascade do |t|
    t.integer "clone_id"
    t.integer "project_id"
    t.index ["clone_id"], name: "index_clones_projects_on_clone_id"
    t.index ["project_id"], name: "index_clones_projects_on_project_id"
  end

  create_table "cmeths", id: :serial, force: :cascade do |t|
    t.string "name"
  end

  create_table "containers", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "barcode"
    t.integer "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dosages", id: :serial, force: :cascade do |t|
    t.decimal "titer"
    t.decimal "titer_atcc"
    t.decimal "titer_to_atcc"
    t.integer "virus_production_id"
    t.integer "user_id"
    t.date "date"
    t.string "plate_name"
    t.text "comment"
    t.date "inactivation"
    t.date "inactivation_atcc"
    t.date "inactivation_standard"
    t.boolean "accepted"
  end

  create_table "enzymes", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "formats", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "genes", id: :serial, force: :cascade do |t|
    t.string "name"
  end

  create_table "inserts", id: :serial, force: :cascade do |t|
    t.integer "clone_batch_id"
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "number"
    t.integer "dismissed", default: 0
    t.index ["clone_batch_id"], name: "index_inserts_on_clone_batch_id"
  end

  create_table "locations", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "barcode"
    t.integer "building_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "options", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.boolean "display_limited_virus"
    t.boolean "display_all_virus"
    t.boolean "display_all_clone_batch"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "options_virus_productions", id: :serial, force: :cascade do |t|
    t.integer "option_id"
    t.integer "virus_production_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["option_id"], name: "index_options_virus_productions_on_option_id"
    t.index ["virus_production_id"], name: "index_options_virus_productions_on_virus_production_id"
  end

  create_table "origins", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pcr_colonies", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "clone_batch_qc_id"
    t.integer "user_id"
    t.text "comment"
    t.date "date"
    t.string "result"
    t.boolean "conclusion"
    t.string "primer_r"
    t.string "primer_f"
    t.integer "primer_f_id"
    t.integer "primer_r_id"
  end

  create_table "pcr_colonies_qc_attachments", id: :serial, force: :cascade do |t|
    t.integer "pcr_colony_id"
    t.integer "qc_attachment_id"
    t.index ["pcr_colony_id"], name: "index_pcr_colonies_qc_attachments_on_pcr_colony_id"
    t.index ["qc_attachment_id"], name: "index_pcr_colonies_qc_attachments_on_qc_attachment_id"
  end

  create_table "plasmid_batch_attachments", id: :serial, force: :cascade do |t|
    t.integer "plasmid_batch_id"
    t.string "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plasmid_batch_qcs", id: :serial, force: :cascade do |t|
    t.integer "plasmid_batch_id"
    t.string "dig_other"
    t.text "comments"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "conclusion"
    t.integer "pcr_colony_id"
    t.string "primer1"
    t.string "primer2"
    t.date "date_send"
    t.string "sma1"
    t.index ["pcr_colony_id"], name: "index_plasmid_batch_qcs_on_pcr_colony_id"
    t.index ["plasmid_batch_id"], name: "index_plasmid_batch_qcs_on_plasmid_batch_id"
  end

  create_table "plasmid_batch_qcs_batches", id: :serial, force: :cascade do |t|
    t.integer "plasmid_batch_id"
    t.integer "plasmid_batch_qc_id"
    t.index ["plasmid_batch_id"], name: "index_plasmid_batch_qcs_batches_on_plasmid_batch_id"
    t.index ["plasmid_batch_qc_id"], name: "index_plasmid_batch_qcs_batches_on_plasmid_batch_qc_id"
  end

  create_table "plasmid_batch_qcs_qc_attachments", id: :serial, force: :cascade do |t|
    t.integer "plasmid_batch_qc_id"
    t.integer "qc_attachment_id"
    t.index ["plasmid_batch_qc_id"], name: "index_plasmid_batch_qcs_qc_attachments_on_plasmid_batch_qc_id"
    t.index ["qc_attachment_id"], name: "index_plasmid_batch_qcs_qc_attachments_on_qc_attachment_id"
  end

  create_table "plasmid_batches", id: :serial, force: :cascade do |t|
    t.integer "clone_batch_id"
    t.integer "unit_id"
    t.string "name"
    t.string "format"
    t.decimal "concentration"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "qc_validation", default: false
    t.integer "strict_validation"
    t.decimal "volume"
    t.integer "vol_unit_id"
    t.integer "row_id"
    t.integer "column_id"
    t.integer "format_id"
    t.integer "number"
    t.integer "user_id"
    t.integer "plasmid_box_id"
    t.date "date"
    t.boolean "trash", default: false
    t.string "barcode"
    t.index ["clone_batch_id"], name: "index_plasmid_batches_on_clone_batch_id"
    t.index ["vol_unit_id"], name: "index_plasmid_batches_on_vol_unit_id"
  end

  create_table "plasmid_batches_productions", id: :serial, force: :cascade do |t|
    t.integer "plasmid_batch_id"
    t.integer "production_id"
    t.decimal "volume", default: "0.0"
    t.decimal "starting_volume"
    t.index ["plasmid_batch_id"], name: "index_plasmid_batches_productions_on_plasmid_batch_id"
    t.index ["production_id"], name: "index_plasmid_batches_productions_on_production_id"
  end

  create_table "plasmid_boxes", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "barcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "positions", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "box_id"
    t.integer "nb"
    t.string "box_name"
  end

  create_table "primers", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "sequence"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sequencing_id"
    t.boolean "available", default: true
  end

  create_table "productions", id: :serial, force: :cascade do |t|
    t.string "name"
    t.boolean "display"
    t.integer "step", default: 0
    t.text "comment"
    t.integer "row_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "target"
    t.integer "last_step", default: 0
    t.date "order_date"
    t.float "percentage", default: 0.0
    t.boolean "locked", default: false
    t.integer "strict_validation"
    t.boolean "pool"
    t.date "today_date"
    t.decimal "production_volume"
    t.string "cbtag"
    t.string "pbtag"
    t.boolean "disable_switch", default: false
  end

  create_table "productions_projects", id: :serial, force: :cascade do |t|
    t.integer "production_id"
    t.integer "project_id"
    t.index ["production_id"], name: "index_productions_projects_on_production_id"
    t.index ["project_id"], name: "index_productions_projects_on_project_id"
  end

  create_table "projects", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "promoters", id: :serial, force: :cascade do |t|
    t.string "name"
  end

  create_table "qc_attachments", id: :serial, force: :cascade do |t|
    t.integer "clone_batch_qc_id"
    t.string "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "qc_attachments_sequencings", id: :serial, force: :cascade do |t|
    t.integer "qc_attachment_id"
    t.integer "sequencing_id"
    t.index ["qc_attachment_id"], name: "index_qc_attachments_sequencings_on_qc_attachment_id"
    t.index ["sequencing_id"], name: "index_qc_attachments_sequencings_on_sequencing_id"
  end

  create_table "sequencings", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "primer"
    t.integer "clone_batch_qc_id"
    t.integer "user_id"
    t.date "date_rec"
    t.date "date_send"
    t.text "comment"
    t.string "result"
    t.boolean "conclusion"
  end

  create_table "shelves", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "barcode"
    t.integer "container_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statistics", id: :serial, force: :cascade do |t|
    t.float "value"
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sterilitytests", id: :serial, force: :cascade do |t|
    t.integer "sterility"
    t.date "date"
    t.integer "virus_production_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "strands", id: :serial, force: :cascade do |t|
    t.string "name"
  end

  create_table "targets", id: :serial, force: :cascade do |t|
    t.string "name"
  end

  create_table "types", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order_set"
  end

  create_table "units", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "username"
    t.string "role"
    t.string "firstname"
    t.string "lastname"
    t.boolean "actual_member", default: true
    t.boolean "cloning_notify", default: true
    t.boolean "production_notify", default: true
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "virus_batches", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "virus_production_id"
    t.date "date"
    t.float "volume"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "comment"
    t.integer "vol_unit_id"
    t.boolean "trash", default: false
    t.string "barcode"
    t.date "date_of_thawing"
    t.integer "position_id"
    t.text "recap"
    t.index ["position_id"], name: "index_virus_batches_on_position_id"
  end

  create_table "virus_productions", id: :serial, force: :cascade do |t|
    t.integer "production_id"
    t.integer "user_id"
    t.integer "vol_unit_id"
    t.decimal "vol"
    t.text "comment"
    t.string "gel_prot"
    t.boolean "invoice"
    t.text "hek_result"
    t.string "animal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date_of_production"
    t.string "number"
    t.string "plasmid_tag"
    t.string "plasmid_batch_tag"
    t.string "rev_plasmid_tag"
    t.string "rev_plasmid_batch_tag"
    t.integer "nb"
    t.string "genes_tag"
    t.string "promoters_tag"
    t.text "recap"
    t.integer "dismissed", default: 0
    t.boolean "hidden"
  end

  create_table "vol_units", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

end
