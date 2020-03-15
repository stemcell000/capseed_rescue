class CreateVolUnits < ActiveRecord::Migration
  def up
  create_table "vol_units", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end
  end
  
  def down
    drop_table :vol_units
  end
end
