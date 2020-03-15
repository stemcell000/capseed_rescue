class CreateTypes < ActiveRecord::Migration
  def up
  create_table "types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "order_set"
  end
  end
  
  def down
    drop_table :types
  end
end
