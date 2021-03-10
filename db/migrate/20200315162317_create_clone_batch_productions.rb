class CreateCloneBatchProductions < ActiveRecord::Migration[5.0]
  def up
    create_table "clone_batches_productions", force: :cascade do |t|
      t.integer "clone_batch_id", index: true
      t.integer "production_id", index: true
    end
  end
  
  def down
    drop_table :clone_batches_productions
  end
end
