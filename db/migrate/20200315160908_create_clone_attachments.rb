class CreateCloneAttachments < ActiveRecord::Migration[5.0]
  def up
    create_table :clone_attachments do |t|
      t.integer  "clone_id"
      t.string   "attachment"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    
    def down
      drop_table :clone_attachments
    end
  end
end
