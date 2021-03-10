class CreatePlasmidBatchAttachments < ActiveRecord::Migration[5.0]
  def change
  create_table "plasmid_batch_attachments", force: :cascade do |t|
    t.integer  "plasmid_batch_id"
    t.string   "attachment"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end
  end
end
