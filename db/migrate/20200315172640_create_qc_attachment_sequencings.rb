class CreateQcAttachmentSequencings < ActiveRecord::Migration
  def change
    create_table "qc_attachments_sequencings", force: :cascade do |t|
    t.integer "qc_attachment_id", index: true
    t.integer "sequencing_id", index: true
  end
  end
end
