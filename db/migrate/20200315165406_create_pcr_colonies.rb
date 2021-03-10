class CreatePcrColonies < ActiveRecord::Migration[5.0]
  def up
  create_table "pcr_colonies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "clone_batch_qc_id"
    t.integer  "user_id"
    t.text     "comment"
    t.date     "date"
    t.string   "result"
    t.boolean  "conclusion"
    t.string   "primer_r"
    t.string   "primer_f"
    t.integer  "primer_f_id"
    t.integer  "primer_r_id"
  end
  end
  
  def down
    drop_table :pcr_colonies
  end
end
