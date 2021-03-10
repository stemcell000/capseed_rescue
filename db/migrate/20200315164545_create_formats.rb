class CreateFormats < ActiveRecord::Migration[5.0]
  def up
  create_table "formats", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end
  end
  
  def down
    drop_table :formats
  end
end
