class CreatePlasmidBatchProductions < ActiveRecord::Migration[5.0]
  def up
  create_table "plasmid_batches_productions", force: :cascade do |t|
    t.integer "plasmid_batch_id", index: true
    t.integer "production_id", index: true
    t.decimal "volume",           default: 0.0
    t.decimal "starting_volume"
  end
  end
  
  def down
    drop_table :plasmid_batches_productions
  end
end
