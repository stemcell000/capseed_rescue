class CreateCloneBatchSequencings < ActiveRecord::Migration[5.0]
  def up
    create_table "clone_batches_sequencings", force: :cascade do |t|
      t.integer "clone_batch_id", index: true
      t.integer "sequencing_id", index: true
    end
  end
  
  def down
    drop_table :clone_batches_sequencings
  end
end
