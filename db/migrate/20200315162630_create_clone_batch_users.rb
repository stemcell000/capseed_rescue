class CreateCloneBatchUsers < ActiveRecord::Migration
  def up
  create_table "clone_batches_users", force: :cascade do |t|
    t.integer  "clone_batch_id", index: true
    t.integer  "user_id", index: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end
  end
  
  def down
    drop_table :clone_batches_users
  end
end
