class CreateStrands < ActiveRecord::Migration
  def up
   create_table "strands", force: :cascade do |t|
    t.string "name"
   end
  end
  
  def down
    drop_table :strands
  end
end
