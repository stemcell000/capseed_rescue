class CreateCloneBatchAttachments < ActiveRecord::Migration
  def up
    create_table :clone_batch_attachments do |t|
      t.integer  "clone_batch_id"
      t.string   "attachment"
      t.datetime "created_at",     null: false
      t.datetime "updated_at",     null: false
    end
  end
  
  def down
    drop_table :clone_batch_attachments
  end
end
