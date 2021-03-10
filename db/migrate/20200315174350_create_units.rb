class CreateUnits < ActiveRecord::Migration[5.0]
  def up
  create_table "units", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
  end
  
  def down
    drop_table :units
  end
end
