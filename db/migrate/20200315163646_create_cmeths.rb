class CreateCmeths < ActiveRecord::Migration[5.0]
  def up
  create_table "cmeths", force: :cascade do |t|
    t.string "name"
  end
  end
  
  def down
    drop_table :cmeths
  end
end
