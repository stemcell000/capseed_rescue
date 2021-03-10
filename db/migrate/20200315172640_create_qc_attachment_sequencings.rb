class CreateQcAttachmentSequencings < ActiveRecord::Migration[5.0]
  def change
    create_table "qc_attachments_sequencings", force: :cascade do |t|
    t.integer "qc_attachment_id", index: true
    t.integer "sequencing_id", index: true
  end
  end
end
