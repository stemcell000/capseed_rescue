class CreateCmeths < ActiveRecord::Migration
  def up
  create_table "cmeths", force: :cascade do |t|
    t.string "name"
  end
  end
  
  def down
    drop_table :cmeths
  end
end
