class CreatePlasmidBatchProductions < ActiveRecord::Migration
  def up
  create_table "plasmid_batches_productions", force: :cascade do |t|
    t.integer "plasmid_batch_id"
    t.integer "production_id"
    t.decimal "volume",           default: 0.0
    t.decimal "starting_volume"
  end
  end
  
  def down
    drop_table :plasmid_batches_productions
  end
end
