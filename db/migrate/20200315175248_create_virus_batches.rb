class CreateVirusBatches < ActiveRecord::Migration[5.0]
  def up
    create_table "virus_batches", force: :cascade do |t|
    t.string   "name"
    t.integer  "virus_production_id"
    t.integer  "box_id"
    t.integer  "row_id"
    t.integer  "column_id"
    t.date     "date"
    t.float    "volume"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.text     "comment"
    t.integer  "vol_unit_id"
    t.boolean  "trash",               default: false
    t.string   "barcode"
    t.date     "date_of_thawing"
  end
  end
  
  def down
    drop_table :virus_batches
  end
end
