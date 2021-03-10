class CreatePlasmidBatchQcs < ActiveRecord::Migration[5.0]
  def up
  create_table "plasmid_batch_qcs", force: :cascade do |t|
    t.integer  "plasmid_batch_id", index: true
    t.string   "dig_other"
    t.text     "comments"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.boolean  "conclusion"
    t.integer  "pcr_colony_id", index: true
    t.string   "primer1"
    t.string   "primer2"
    t.date     "date_send"
    t.string   "sma1"
  end
  end
  
  def down
    drop_table :plasmid_batch_qcs
  end
end
