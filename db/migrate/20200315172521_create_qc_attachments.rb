class CreateQcAttachments < ActiveRecord::Migration
  def change
   create_table "qc_attachments", force: :cascade do |t|
    t.integer  "clone_batch_qc_id"
    t.string   "attachment"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end
  end
  
  def down
    drop_table :qc_attachments
  end
end
