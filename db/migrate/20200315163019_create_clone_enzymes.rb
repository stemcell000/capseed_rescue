class CreateCloneEnzymes < ActiveRecord::Migration
  def up
  create_table "clones_enzymes", force: :cascade do |t|
    t.integer "clone_id",  index: true
    t.integer "enzyme_id", index: true
  end
  end
  
  def down
    drop_table :clones_enzymes
  end
end
