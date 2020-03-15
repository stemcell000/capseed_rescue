class CreatePrimers < ActiveRecord::Migration
  def ip
  create_table "primers", force: :cascade do |t|
    t.string   "name"
    t.text     "sequence"
    t.text     "comment"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "sequencing_id"
    t.boolean  "available",     default: true
  end
  end
  
  def down 
    drop_table :primers
  end
end
