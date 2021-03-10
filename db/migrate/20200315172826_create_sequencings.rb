class CreateSequencings < ActiveRecord::Migration[5.0]
  def up
    create_table "sequencings", force: :cascade do |t|
      t.datetime "created_at",        null: false
      t.datetime "updated_at",        null: false
      t.string   "name"
      t.string   "primer"
      t.integer  "clone_batch_qc_id"
      t.integer  "user_id"
      t.date     "date_rec"
      t.date     "date_send"
      t.text     "comment"
      t.string   "result"
      t.boolean  "conclusion"
    end
  end
  
  def down
    drop_table :sequencings
  end
end
