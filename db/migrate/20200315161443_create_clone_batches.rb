class CreateCloneBatches < ActiveRecord::Migration[5.0]
  def up
  create_table "clone_batches", force: :cascade do |t|
    t.integer  "target_id", index: true
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
  end
  
  def down
    drop_table :clone_batches
  end
end
