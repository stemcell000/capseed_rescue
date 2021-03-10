class CreateGenes < ActiveRecord::Migration[5.0]
  def up
  create_table "genes", force: :cascade do |t|
    t.string "name"
  end
  end
  
  def down
    drop_table :genes
  end
end
