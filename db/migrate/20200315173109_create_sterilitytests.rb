class CreateSterilitytests < ActiveRecord::Migration[5.0]
  def change
 create_table "sterilitytests", force: :cascade do |t|
    t.integer  "sterility"
    t.date     "date"
    t.integer  "virus_production_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end
  end

def down
  drop_table :sterilitytests
end
end
