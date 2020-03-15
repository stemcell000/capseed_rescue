class CreateCloneBatchPromoters < ActiveRecord::Migration
  def up
    create_table "clone_batches_promoters", force: :cascade do |t|
      t.integer "clone_batch_id"
      t.integer "promoter_id"
    end
  end
  
  def down
    drop_table :clone_batches_sequencings
  end
end
