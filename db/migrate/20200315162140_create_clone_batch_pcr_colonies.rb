class CreateCloneBatchPcrColonies < ActiveRecord::Migration
  def up
  create_table "clone_batches_pcr_colonies", force: :cascade do |t|
    t.integer "clone_batch_id"
    t.integer "pcr_colony_id"
  end
  end
  
  def down
    drop_table :clone_batches_pcr_colonies
  end
end
