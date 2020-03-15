class CreateCloneBatchOptions < ActiveRecord::Migration
  def up
  create_table "clone_batches_options", force: :cascade do |t|
    t.integer  "clone_batch_id"
    t.integer  "option_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end
  end
  
  def down
    drop_table :clone_batches_options
  end
end
