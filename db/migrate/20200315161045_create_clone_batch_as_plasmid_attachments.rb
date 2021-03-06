class CreateCloneBatchAsPlasmidAttachments < ActiveRecord::Migration[5.0]
  def up
    create_table :clone_batch_as_plasmid_attachments do |t|
      t.integer  "clone_batch_id"
      t.string   "attachment"
      t.datetime "created_at",     null: false
      t.datetime "updated_at",     null: false
    end
  end
  
  def down
    drop_table :clone_batch_as_plasmid_attachments
  end
end
