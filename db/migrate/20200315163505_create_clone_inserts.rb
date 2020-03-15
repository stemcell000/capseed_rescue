class CreateCloneInserts < ActiveRecord::Migration
  def up
  create_table "clones_inserts", force: :cascade do |t|
    t.integer "clone_id", index: true
    t.integer "insert_id", index: true
    t.integer "backbone_id"
  end
  end
  
  def down
    drop_table :clones_inserts
  end
end
