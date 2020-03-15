class CreateCloneBatchProductions < ActiveRecord::Migration
  def up
    create_table "clone_batches_productions", force: :cascade do |t|
      t.integer "clone_batch_id"
      t.integer "production_id"
    end
  end
  
  def down
    drop_table :clone_batches_productions
  end
end
