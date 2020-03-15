class CreatePlasmidBatchQcBatches < ActiveRecord::Migration
  def up
  create_table "plasmid_batch_qcs_batches", force: :cascade do |t|
    t.integer "plasmid_batch_id", index: true
    t.integer "plasmid_batch_qc_id", index: true
  end
  end
  
  def down
    drop_table :plasmid_batch_qcs_batches
  end
end
