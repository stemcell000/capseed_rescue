class CreateCloneEnzymes < ActiveRecord::Migration
  def up
  create_table "clones_enzymes", force: :cascade do |t|
    t.integer "clone_id",  null: false
    t.integer "enzyme_id", null: false
  end
  end
  
  def down
    drop_table :clones_enzymes
  end
end
