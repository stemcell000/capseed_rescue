class CreateCloneBatchPcrColonies < ActiveRecord::Migration[5.0]
  def up
  create_table "clone_batches_pcr_colonies", force: :cascade do |t|
    t.integer "clone_batch_id", index: true
    t.integer "pcr_colony_id", index: true
  end
  end
  
  def down
    drop_table :clone_batches_pcr_colonies
  end
end
