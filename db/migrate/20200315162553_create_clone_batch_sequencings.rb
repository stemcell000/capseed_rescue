class CreateCloneBatchSequencings < ActiveRecord::Migration
  def up
    create_table "clone_batches_sequencings", force: :cascade do |t|
      t.integer "clone_batch_id"
      t.integer "sequencing_id"
    end
  end
  
  def down
    drop_table :clone_batches_sequencings
  end
end
