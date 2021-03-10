class CreateCloneBatchOptions < ActiveRecord::Migration[5.0]
  def up
  create_table "clone_batches_options", force: :cascade do |t|
    t.integer  "clone_batch_id", index: true
    t.integer  "option_id", index: true
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end
  end
  
  def down
    drop_table :clone_batches_options
  end
end
