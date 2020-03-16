class CreatePlasmidBatchQcAttachements < ActiveRecord::Migration
  def up
  create_table "plasmid_batch_qcs_qc_attachments", force: :cascade do |t|
    t.integer "plasmid_batch_qc_id", index: true
    t.integer "qc_attachment_id", index: true
  end
  end
  
  def down
    drop_table :plasmid_batch_qcs_qc_attachments
  end
end