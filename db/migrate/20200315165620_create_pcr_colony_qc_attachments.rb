class CreatePcrColonyQcAttachments < ActiveRecord::Migration
  def up
    create_table "pcr_colonies_qc_attachments", force: :cascade do |t|
      t.integer "pcr_colony_id", index: true
      t.integer "qc_attachment_id", index: true
    end
  end
  
  def down
    drop_table :pcr_colonies_qc_attachments
  end
end
