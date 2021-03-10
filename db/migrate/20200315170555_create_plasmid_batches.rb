class CreatePlasmidBatches < ActiveRecord::Migration[5.0]
  def up
   create_table "plasmid_batches", force: :cascade do |t|
    t.integer  "clone_batch_id", index: true
    t.integer  "unit_id"
    t.string   "name"
    t.string   "format"
    t.decimal  "concentration"
    t.text     "comment"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.boolean  "qc_validation",     default: false
    t.integer  "strict_validation"
    t.decimal  "volume"
    t.integer  "vol_unit_id", index: true
    t.integer  "row_id"
    t.integer  "column_id"
    t.integer  "format_id"
    t.integer  "number"
    t.integer  "user_id"
    t.integer  "box_id"
    t.date     "date"
    t.boolean  "trash",             default: false
    t.string   "barcode"
  end
  end
  
  def down
    drop_table :plasmid_batches
  end
end
